extends Fase

var seq1: PackedScene = preload("res://cenas/sequencias/sequencia_1.tscn")
var seq2: PackedScene = preload("res://cenas/sequencias/sequencia_2.tscn")
var seq3: PackedScene = preload("res://cenas/sequencias/sequencia_3.tscn")
var seq4: PackedScene = preload("res://cenas/sequencias/sequencia_4.tscn")

func _ready() -> void:
	super()
	Stats.fase_over.connect(final)
	#coloca todas as sequencias da fase no array de sequencias
	sequencias.append(seq1)
	sequencias.append(seq2)
	sequencias.append(seq3)
	sequencias.append(seq4)
	
	
	rodar_sequencias()
	

func final():
	get_tree().change_scene_to_file("res://cenas/menu/menufinal.tscn")
