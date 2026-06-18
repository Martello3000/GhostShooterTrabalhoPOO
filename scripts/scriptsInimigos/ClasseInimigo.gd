extends Node
class_name Inimigo

var path: PathFollow2D
var velocidade: float = 100
var vida: int = 1

var andando: bool = true


func _physics_process(delta: float) -> void:
	if path and andando:
		path.progress += velocidade * delta
		if is_equal_approx(path.progress_ratio, 1.0):
			andando = false
			Stats.alvo_over.emit()
			queue_free()
	
	if vida <= 0:
		morrer()


func definirPath(novo_path):
	path = novo_path

func morrer():
	andando = false
	Stats.alvo_over.emit()
	queue_free()
