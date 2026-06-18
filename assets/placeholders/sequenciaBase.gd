extends Node
class_name Sequencia

var inimigo1: PackedScene = preload("res://cenas/inimigos/alvo_1.tscn")

var caminhos: Array[Node]

var instancias: Array

func _ready() -> void:
	caminhos = find_children("", "PathFollow2D")


func adicionarInimigos():
	for caminho in caminhos:
		var alvo
		if caminho.name == "Inimigo1":
			alvo = inimigo1.instantiate()
		alvo.path = caminho
		caminho.add_child(alvo)
