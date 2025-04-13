extends Node

@onready var load_game_files: Node = $"../LoadGameFiles"
var config = ConfigFile.new()
var config_path = "user://settings.cfg"

var settings
func _ready() -> void:
	settings = load_game_files.get_savedData()["data"]

func save_master_volume(volume:float):
	settings["master_volume"] = volume
	_save_settings()

func save_music_volume(volume:float):
	settings["music_volume"] = volume
	_save_settings()

func save_button_voume(volume:float):
	settings["button_volume"]
	_save_settings()

func save_masster_mute(check:bool):
	settings["mute"]=check
	_save_settings()

func save_music_mute(check:bool):
	settings["mute_music"]=check
	_save_settings()

func save_button_mute(check:bool):
	settings["mute_buttons"]=check
	_save_settings()

func save_res_index(i:int):
	settings["resolution_index"] = i
	_save_settings()
	
func save_fullscreen_state(check:bool):
	settings["fullscreen"] = check
	_save_settings()
	
func save(data):
	config.set_value("Settings", "data", data)
	var error = config.save(config_path)
	if error != OK:
		push_warning("Error saving settings: " + str(error))

func _save_settings() -> void:
	config.set_value("Settings", "data", settings)
	var error = config.save(config_path)
	if error != OK:
		push_warning("Error saving settings: " + str(error))
