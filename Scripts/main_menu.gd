extends Control



func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/LevelSelection.tscn")


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Options.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_start_mouse_entered() -> void:
	$HoverSound.play()

func _on_options_mouse_entered() -> void:
	$HoverSound.play()

func _on_button_3_mouse_entered() -> void:
	$HoverSound.play()
