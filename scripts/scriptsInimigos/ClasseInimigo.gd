extends Node
class_name Inimigo

var path: PathFollow2D
var velocidade: float = 300
var vida: int = 1

var andando: bool = true


func _physics_process(delta: float) -> void:
	
	#move o inimigo no Path2D de acordo com a velocidade
	if path and andando:
		path.progress += velocidade * delta
		if is_equal_approx(path.progress_ratio, 1.0):
			andando = false
			#emite sinal que alvo não existe mais
			Stats.alvo_over.emit()
			queue_free()
	
	if vida <= 0:
		morrer()


func definirPath(novo_path):
	path = novo_path

func morrer():
	#emite sinal que alvo não existe mais
	andando = false
	Stats.alvo_over.emit()
	queue_free()
