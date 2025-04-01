extends Control

@onready var master_volume: HSlider = $"Panel/Master Volume"
@onready var music_volume: HSlider = $"Panel/Music Volume"
@onready var full_screen: CheckButton = $Panel/FullScreen



func _ready() -> void:
	pass

	
func _on_back_pressed() -> void:
	GameManager.navigation.to_mainmenu()

func _on_back_mouse_entered() -> void:
	GameManager.sounds.hoverSound()

func _on_master_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value)


func _on_music_volume_value_changed(value: float) -> void:
	GameManager.sounds.change_music_volume(value)


func _on_mute_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,toggled_on)


func _on_resolution_item_selected(index: int) -> void:
	match index :
		0:
			print(index)
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1:
			print(index)
			DisplayServer.window_set_size(Vector2i(1600,900))
		2:
			print(index)
			DisplayServer.window_set_size(Vector2i(1280,720))
		3:
			print(index)
			DisplayServer.window_set_size(Vector2i(1152,648))


func _on_full_screen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
