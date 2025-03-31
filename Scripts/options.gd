extends Control



func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")

func _on_back_mouse_entered() -> void:
	$HoverSound.play()
