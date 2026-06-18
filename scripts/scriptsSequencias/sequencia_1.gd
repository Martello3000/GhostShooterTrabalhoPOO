extends Node2D

var inimigo1: PackedScene = preload("res://cenas/inimigos/alvo_1.tscn")


func _ready() -> void:
	var caminhos: Array[Node] = find_children("", "PathFollow2D")
	for caminho in caminhos:
		print("ayaya")
		var alvo = inimigo1.instantiate()
		alvo.path = caminho
		caminho.add_child(alvo)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
