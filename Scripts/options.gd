extends Control

@onready var master_volume: HSlider = $"Panel/Master Volume"
@onready var music_volume: HSlider = $"Panel/Music Volume"
@onready var full_screen: CheckButton = $Panel/FullScreen
@onready var resolution: OptionButton = $Panel/Resolution

func _ready() -> void:
	var resList:Dictionary = GameManager.screen.getScreenResolutions()
	for i in resList:
		resolution.add_item(str(resList[i][0])+"x"+str(resList[i][1]),i)
	

func _on_master_volume_value_changed(value: float) -> void:
	GameManager.sounds.change_master_volume(value)

func _on_mute_toggled(toggled_on: bool) -> void:
	if toggled_on:
		GameManager.sounds.master_volume_off()
	else:
		GameManager.sounds.master_volume_on()


func _on_music_volume_value_changed(value: float) -> void:
	GameManager.sounds.change_music_volume(value)

func _on_mute_music_toggled(toggled_on: bool) -> void:
	if toggled_on:
		GameManager.sounds.music_off()
	else:
		GameManager.sounds.music_on()


func _on_button_volume_value_changed(value: float) -> void:
	GameManager.sounds.change_hover_Volume(value)
	
func _on_mute_buttons_toggled(toggled_on: bool) -> void:
	if toggled_on:
		GameManager.sounds.hoverSoundOff()
	else:
		GameManager.sounds.hoverSoundOn()


func _on_resolution_item_selected(index: int) -> void:
	var changeTo=resolution.get_item_text(index).split("x")
	GameManager.screen.changeResolution(int(changeTo[0]),int(changeTo[1]))

func _on_full_screen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		GameManager.screen.fullScreen()
	else:
		GameManager.screen.windowed()


func _on_reset_pressed() -> void:
	pass 


func _on_back_mouse_entered() -> void:
	GameManager.sounds.hoverSound()

func _on_back_pressed() -> void:
	GameManager.navigation.to_mainmenu()
