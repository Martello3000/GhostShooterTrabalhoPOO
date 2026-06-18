extends Node2D

@export var crosshair: AnimatedSprite2D
@export var colisao_tiro: CollisionShape2D
@export var hitbox_tiro: Area2D
@export var CDTimer: Timer
@export var BarraCD: ProgressBar


var em_cooldown: bool = false


func _ready() -> void:
	Stats.arma_equipada = 0
	BarraCD.max_value = CDTimer.wait_time
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _input(event: InputEvent) -> void:
	
	#Equipar armas
	if event.is_action_pressed("equiparPistola") and !em_cooldown:
		equipar_pistola()
	if event.is_action_pressed("equiparShotgun") and !em_cooldown:
		equipar_shotgun()
	if event.is_action_pressed("equiparSniper") and !em_cooldown:
		equipar_sniper()
	
	#Tiro
	if event.is_action_pressed("atirar") and !em_cooldown:
		colisao_tiro.disabled = false
		em_cooldown = true
		CDTimer.start()
		await get_tree().create_timer(0.1).timeout
		colisao_tiro.disabled = true


func _process(_delta: float) -> void:
	BarraCD.value = CDTimer.time_left
	if BarraCD.value == BarraCD.min_value:
		BarraCD.visible = false
	else:
		BarraCD.visible = true
	hitbox_tiro.global_position = get_global_mouse_position()
	crosshair.global_position = get_global_mouse_position()

func equipar_pistola():
	Stats.arma_equipada = 0
	colisao_tiro.shape.radius = 35
	CDTimer.wait_time = 0.25
	BarraCD.max_value = CDTimer.wait_time
	crosshair.scale = Vector2(1,1)
	Stats.dano = 1

func equipar_shotgun():
	Stats.arma_equipada = 1
	colisao_tiro.shape.radius = 155
	CDTimer.wait_time = 1.25
	BarraCD.max_value = CDTimer.wait_time
	crosshair.scale = Vector2(3,3)
	Stats.dano = 3

func equipar_sniper():
	Stats.arma_equipada = 2
	colisao_tiro.shape.radius = 15
	CDTimer.wait_time = 2
	BarraCD.max_value = CDTimer.wait_time
	crosshair.scale = Vector2(0.5,0.5)
	Stats.dano = 5


func _on_cooldown_timer_timeout() -> void:
	em_cooldown = false


func _on_hitbox_tiro_area_entered(area: Area2D) -> void:
	colisao_tiro.set_deferred("disabled", true)
	area.owner.vida -= Stats.dano
