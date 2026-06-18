extends Node
class_name Sequencia

var inimigo1: PackedScene = preload("res://cenas/inimigos/alvo_1.tscn")
var inimigo2: PackedScene = preload("res://cenas/inimigos/alvo_2.tscn")

var caminhos: Array[Node]


func _ready() -> void:
	#junta todos os PathFollow2D no array caminhos
	caminhos = find_children("", "PathFollow2D")
	Stats.alvo_over.connect(tentar_acabar_sequencia)
	


func adicionarInimigos():
	caminhos = find_children("", "PathFollow2D")
	for caminho in caminhos:
		var alvo
		#instancia um inimigo baseado no nome do PathFollow2D
		if caminho.name == "Alvo1":
			alvo = inimigo1.instantiate()
		if caminho.name == "Alvo2":
			alvo = inimigo2.instantiate()
		#define o caminho para o alvo
		alvo.path = caminho
		caminho.add_child(alvo)

func tentar_acabar_sequencia():
	caminhos = find_children("", "PathFollow2D")
	#verifica se não há inimigos sobrando na sequencia. caso não tenha nenhum, emite o sinal de sequencia over
	for caminho in caminhos:
		if caminho.get_child_count() > 0:
			if caminho.get_child(0).andando == true:
				return
	Stats.sequencia_over.emit()
	queue_free()
