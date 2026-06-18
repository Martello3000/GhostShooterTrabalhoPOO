extends Inimigo

func _ready() -> void:
	pass

func morrer():
	Stats.score += 50
	super()
