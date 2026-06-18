extends Node
class_name Inimigo

var path: PathFollow2D
var velocidade: float = 100

var andando: bool = true


func _physics_process(delta: float) -> void:
	if path and andando:
		path.progress += velocidade * delta
		if is_equal_approx(path.progress_ratio, 1.0):
			andando = false


func definirPath(novo_path):
	path = novo_path
