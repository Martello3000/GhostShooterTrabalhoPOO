extends Control

@export var classe: Label
@export var score: Label


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	classe.text = Stats.classe_atual
	score.text = str(Stats.score)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/menu/menu.tscn")
