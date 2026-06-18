extends Node2D

@export var crosshair: AnimatedSprite2D
@export var hitbox_tiro: CollisionShape2D
@export var CDTimer: Timer

var em_cooldown: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
		hitbox_tiro.disabled = false
		em_cooldown = true
		CDTimer.start()
		await get_tree().create_timer(0.1).timeout
		hitbox_tiro.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	crosshair.global_position = get_global_mouse_position()

func equipar_pistola():
	Stats.arma_equipada = 0
	hitbox_tiro.shape.radius = 35
	CDTimer.wait_time = 0.25

func equipar_shotgun():
	Stats.arma_equipada = 1
	hitbox_tiro.shape.radius = 155
	CDTimer.wait_time = 1.25

func equipar_sniper():
	Stats.arma_equipada = 2
	hitbox_tiro.shape.radius = 15
	CDTimer.wait_time = 2


func _on_cooldown_timer_timeout() -> void:
	em_cooldown = false
