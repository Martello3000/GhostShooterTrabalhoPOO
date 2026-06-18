extends Node
class_name Fase


#Quando iniciar fase nova, colocar sequencias da fase dentro desse Array
var sequencias: Array[PackedScene] = []

var seq_atual_num: int = 0

func _ready() -> void:
	Stats.sequencia_over.connect(proxima_sequencia)


#instancia sequencia na cena
func rodar_sequencias():
	var seq = sequencias[seq_atual_num].instantiate()
	add_child(seq)

#roda proxima sequencia no array
func proxima_sequencia():
	if not (seq_atual_num + 1) >= sequencias.size():
		seq_atual_num += 1
		rodar_sequencias()
	else:
		#se array tiver acabado, manda sinal que acabou fase
		Stats.fase_over.emit()
