extends Control

@onready var master_volume: HSlider = $"Panel/Master Volume"
@onready var mute: CheckButton = $Panel/Mute
@onready var music_volume: HSlider = $"Panel/Music Volume"
@onready var mute_music: CheckButton = $"Panel/Mute Music"
@onready var button_volume: HSlider = $"Panel/Button Volume"
@onready var mute_buttons: CheckButton = $"Panel/Mute Buttons"
@onready var resolution: OptionButton = $Panel/Resolution
@onready var full_screen: CheckButton = $Panel/FullScreen

var resolutionList: Dictionary

var data
func _ready() -> void:
	_prepare_reolutionSelection()
	data = GameManager.loadGameFiles.get_savedData()["data"]
	_updateUi()
	#print("current settings", data)
	
func _updateUi():
	master_volume.value = data["master_volume"]
	mute.button_pressed = data["mute"]
	music_volume.value = data["music_volume"]
	mute_music.button_pressed = data["mute_music"]
	button_volume.value = data["button_volume"]
	mute_buttons.button_pressed = data["mute_buttons"]
	resolution.selected = data["resolution_index"]
	full_screen.button_pressed = data["fullscreen"]

func _prepare_reolutionSelection():
	resolutionList = GameManager.screen.getScreenResolutions()
	for i in resolutionList:
		resolution.add_item(str(resolutionList[i][0]) + "x" + str(resolutionList[i][1]), i)
		
func _on_master_volume_value_changed(value: float) -> void:
	GameManager.sounds.change_master_volume(value)
	GameManager.save_settings.save_master_volume(value)
	

func _on_mute_toggled(toggled_on: bool) -> void:
	if toggled_on:
		GameManager.sounds.master_volume_off()
	else:
		GameManager.sounds.master_volume_on()
	GameManager.save_settings.save_masster_mute(toggled_on)
	

func _on_music_volume_value_changed(value: float) -> void:
	GameManager.sounds.change_music_volume(value)
	GameManager.save_settings.save_music_volume(value)

func _on_mute_music_toggled(toggled_on: bool) -> void:
	if toggled_on:
		GameManager.sounds.music_off()
	else:
		GameManager.sounds.music_on()
	GameManager.save_settings.save_music_mute(toggled_on)
	

func _on_button_volume_value_changed(value: float) -> void:
	GameManager.sounds.change_hover_Volume(value)
	GameManager.save_settings.save_button_voume(value)

func _on_mute_buttons_toggled(toggled_on: bool) -> void:
	if toggled_on:
		GameManager.sounds.hoverSoundOff()
	else:
		GameManager.sounds.hoverSoundOn()
	GameManager.save_settings.save_button_mute(toggled_on)
	

func _on_resolution_item_selected(index: int) -> void:
	var changeTo = resolution.get_item_text(index).split("x")
	if changeTo.size() == 2 and changeTo[0].is_valid_int() and changeTo[1].is_valid_int():
		GameManager.screen.changeResolution(int(changeTo[0]), int(changeTo[1]))
		GameManager.save_settings.save_res_index(index)
	else:
		push_warning("Invalid resolution string: " + resolution.get_item_text(index))


func _on_full_screen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		GameManager.screen.fullScreen()
	else:
		GameManager.screen.windowed()
	GameManager.save_settings.save_fullscreen_state(toggled_on)

func _on_reset_pressed() -> void:
	var data = GameManager.loadGameFiles.getDefaultSettings()
	GameManager.save_settings.save(data)
	GameManager.apply_init_settings.apply()
	master_volume.value = data["master_volume"]
	mute.button_pressed = data["mute"]
	music_volume.value = data["music_volume"]
	mute_music.button_pressed = data["mute_music"]
	button_volume.value = data["button_volume"]
	mute_buttons.button_pressed = data["mute_buttons"]
	resolution.selected = data["resolution_index"]
	full_screen.button_pressed = data["fullscreen"]
#func _on_save_settings_pressed() -> void:
	#save_settings()

func _on_back_mouse_entered() -> void:
	GameManager.sounds.hoverSound()

func _on_back_pressed() -> void:
	GameManager.navigation.to_mainmenu()
