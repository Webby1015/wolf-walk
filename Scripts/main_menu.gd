extends Control


func _on_start_pressed() -> void:
	GameManager.navigation.to_levelSelection()

func _on_options_pressed() -> void:
	GameManager.navigation.to_options()

func _on_quit_pressed() -> void:
	GameManager.navigation.quit_game()

func _on_start_mouse_entered() -> void:
	GameManager.sounds.hoverSound()

func _on_options_mouse_entered() -> void:
	GameManager.sounds.hoverSound()

func _on_button_3_mouse_entered() -> void:
	GameManager.sounds.hoverSound()
