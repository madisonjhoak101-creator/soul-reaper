extends Control

@export var game_scene_path : String = "res://town.tscn"
@export var tutorial_scene_path : String = "res://tutorial.tscn"
@onready var main_menu_path : String = "res://main_menu.tscn"

func _on_play_button_pressed() -> void:
	if game_scene_path != "":
		get_tree().change_scene_to_file(game_scene_path)

func _on_tutorial_button_pressed() -> void:
	if tutorial_scene_path != "":
		get_tree().change_scene_to_file("res://tutorial.tscn")

func _on_quite_button_pressed() -> void:
	get_tree().quit()


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn.tscn")
