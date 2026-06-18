extends Fase

var seq1: PackedScene = preload("res://cenas/sequencias/sequencia_1.tscn")
var seq2: PackedScene = preload("res://cenas/sequencias/sequencia_2.tscn")

func _ready() -> void:
	super()
	sequencias.append(seq1)
	sequencias.append(seq2)
	
	
	rodar_sequencias()
	
