extends Control


func _on_back_pressed() -> void:
	GameManager.navigation.to_mainmenu()

func _on_back_mouse_entered() -> void:
	GameManager.sounds.hoverSound()
