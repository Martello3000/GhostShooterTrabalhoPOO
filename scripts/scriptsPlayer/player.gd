extends Node2D

@export var crosshair: AnimatedSprite2D
@export var colisao_tiro: CollisionShape2D
@export var hitbox_tiro: Area2D
@export var CDTimer: Timer
@export var BarraCD: ProgressBar
@export var ReloadTimer: Timer
@export var textoReload: Node2D

@onready var ReloadBar: ProgressBar = $HUD/PanelContainer/VBoxContainer/NinePatchRect/ProgressBar

var em_cooldown: bool = false
var recarregando: bool = false

func _ready() -> void:
	Stats.arma_equipada = "Pistola"
	BarraCD.max_value = CDTimer.wait_time
	ReloadBar.value = ReloadBar.max_value
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _input(event: InputEvent) -> void:
	
	#Equipar armas
	if event.is_action_pressed("equiparPistola") and !em_cooldown and !recarregando:
		equipar_pistola()
	if event.is_action_pressed("equiparShotgun") and !em_cooldown and !recarregando:
		equipar_shotgun()
	if event.is_action_pressed("equiparSniper") and !em_cooldown and !recarregando:
		equipar_sniper()
	
	#Tiro
	if event.is_action_pressed("atirar") and !em_cooldown and !recarregando:
		if Stats.municao[Stats.arma_equipada] > 0:
			colisao_tiro.disabled = false
			em_cooldown = true
			CDTimer.start()
			await get_tree().create_timer(0.1).timeout
			colisao_tiro.disabled = true
			Stats.municao[Stats.arma_equipada] -= 1
	if event.is_action_pressed("reload") and !em_cooldown and !recarregando:
		textoReload.visible = true
		recarregando = true
		Stats.municao[Stats.arma_equipada] = Stats.municaoMax[Stats.arma_equipada]
		ReloadTimer.wait_time = Stats.reloadSpeed[Stats.arma_equipada] * Stats.reloadMultiplier
		ReloadTimer.start()
		ReloadBar.max_value = ReloadTimer.wait_time
		

var timer_do_pisca: float = 0
func _process(_delta: float) -> void:
	
	BarraCD.value = CDTimer.time_left
	if BarraCD.value == BarraCD.min_value:
		BarraCD.visible = false
	else:
		BarraCD.visible = true
	hitbox_tiro.global_position = get_global_mouse_position()
	crosshair.global_position = get_global_mouse_position()
	textoReload.global_position = get_global_mouse_position()
	
	if recarregando:
		crosshair.visible = false
		timer_do_pisca += _delta
		if timer_do_pisca >= 0.3:
			textoReload.visible = !textoReload.visible
			timer_do_pisca = 0
	else:
		textoReload.visible = false
		crosshair.visible = true
	
	ReloadBar.value = ReloadTimer.wait_time - ReloadTimer.time_left
	

func equipar_pistola():
	Stats.arma_equipada = "Pistola"
	colisao_tiro.shape.radius = 35
	CDTimer.wait_time = 0.25
	BarraCD.max_value = CDTimer.wait_time * Stats.switchMultiplier
	crosshair.scale = Vector2(1,1)
	Stats.dano = 1 * Stats.damageMultiplier

func equipar_shotgun():
	Stats.arma_equipada = "Shotgun"
	colisao_tiro.shape.radius = 155
	CDTimer.wait_time = 1.25
	BarraCD.max_value = CDTimer.wait_time
	crosshair.scale = Vector2(3,3)
	Stats.dano = 3 * Stats.damageMultiplier

func equipar_sniper():
	Stats.arma_equipada = "Sniper"
	colisao_tiro.shape.radius = 15
	CDTimer.wait_time = 2
	BarraCD.max_value = CDTimer.wait_time
	crosshair.scale = Vector2(0.5,0.5)
	Stats.dano = 5 * Stats.damageMultiplier


func _on_cooldown_timer_timeout() -> void:
	em_cooldown = false


func _on_hitbox_tiro_area_entered(area: Area2D) -> void:
	colisao_tiro.set_deferred("disabled", true)
	area.owner.vida -= Stats.dano


func _on_reload_timer_timeout() -> void:
	recarregando = false
