extends Inimigo

func _ready() -> void:
	velocidade = 350
	vida = 5

func morrer():
	Stats.score += 100
	super()
