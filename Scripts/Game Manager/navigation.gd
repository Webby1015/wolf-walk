extends Node

func to_mainmenu()->void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")

func to_levelSelection()->void:
	get_tree().change_scene_to_file("res://Scenes/LevelSelection.tscn")

func to_options()->void:
	get_tree().change_scene_to_file("res://Scenes/Options.tscn")

func quit_game()->void:
	get_tree().quit()	
