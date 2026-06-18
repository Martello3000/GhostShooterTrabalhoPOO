extends Node
class_name Fase


#Quando iniciar fase nova, colocar sequencias da fase dentro desse Array
var sequencias: Array[PackedScene] = []

var seq_atual_num: int = 0

func _ready() -> void:
	Stats.sequencia_over.connect(proxima_sequencia)



func rodar_sequencias():
	var seq = sequencias[seq_atual_num].instantiate()
	add_child(seq)

func proxima_sequencia():
	print("sinal recebido")
	if not (seq_atual_num + 1) >= sequencias.size():
		seq_atual_num += 1
		rodar_sequencias()
	else:
		print("Fase acabou")
		Stats.fase_over.emit()
