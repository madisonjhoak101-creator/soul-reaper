extends Control

@export var game_scene_path : String = "res://graveyard.tscn"
@export var tutorial_scene_path : String = "res://tutorial.tscn"

func _on_play_button_pressed():
	if game_scene_path != "":
		get_tree().change_scene_to_file(game_scene_path)

func _on_tutorial_button_pressed():
	if tutorial_scene_path != "":
		get_tree().change_scene_to_file(game_scene_path)

func _on_quite_button_pressed():
	get_tree().quit()
