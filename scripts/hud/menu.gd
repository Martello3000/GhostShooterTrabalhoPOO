extends CanvasLayer




func _on_button_pressed_arqueiro() -> void:
	Stats.classe_atual = "Arqueiro"
	Stats.reloadMultiplier = 0.5
	get_tree().change_scene_to_file("res://cenas/fases/fase_teste.tscn")


func _on_button_pressed_ladino() -> void:
	Stats.classe_atual = "Ladino"
	Stats.switchMultiplier = 0.5
	get_tree().change_scene_to_file("res://cenas/fases/fase_teste.tscn")


func _on_button_pressed_mago() -> void:
	Stats.classe_atual = "Mago"
	Stats.damageMultiplier = 1.5
	get_tree().change_scene_to_file("res://cenas/fases/fase_teste.tscn")
