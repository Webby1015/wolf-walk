extends Control

@onready var master_volume: HSlider = $"Panel/Master Volume"
@onready var mute: CheckButton = $Panel/Mute
@onready var music_volume: HSlider = $"Panel/Music Volume"
@onready var mute_music: CheckButton = $"Panel/Mute Music"
@onready var button_volume: HSlider = $"Panel/Button Volume"
@onready var mute_buttons: CheckButton = $"Panel/Mute Buttons"
@onready var resolution: OptionButton = $Panel/Resolution
@onready var full_screen: CheckButton = $Panel/FullScreen

var resolutionList:Dictionary
func _ready() -> void:
	resolutionList = GameManager.screen.getScreenResolutions()
	for i in resolutionList:
		resolution.add_item(str(resolutionList[i][0])+"x"+str(resolutionList[i][1]),i)
	

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
	print(index)
	var changeTo=resolution.get_item_text(index).split("x")
	GameManager.screen.changeResolution(int(changeTo[0]),int(changeTo[1]))

func _on_full_screen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		GameManager.screen.fullScreen()
	else:
		GameManager.screen.windowed()


func _on_reset_pressed() -> void:
	GameManager.sounds.change_master_volume(0.0) 
	master_volume.value = 0.0
	GameManager.sounds.master_volume_on()
	mute.set_pressed_no_signal(false)
	GameManager.sounds.change_music_volume(0.0)
	music_volume.value = 0.0
	GameManager.sounds.music_on()
	mute_music.set_pressed_no_signal(false)
	GameManager.sounds.change_hover_Volume(0.0)
	button_volume.value = 0.0
	GameManager.sounds.hoverSoundOn()
	mute_buttons.set_pressed_no_signal(false)
	GameManager.screen.changeResolution(resolutionList[0][0],resolutionList[0][1])
	resolution.select(0)
	GameManager.screen.fullScreen()
	full_screen.set_pressed_no_signal(true)
	
func _on_back_mouse_entered() -> void:
	GameManager.sounds.hoverSound()

func _on_back_pressed() -> void:
	GameManager.navigation.to_mainmenu()
