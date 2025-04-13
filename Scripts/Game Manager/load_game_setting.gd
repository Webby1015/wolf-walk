extends Node

var config = ConfigFile.new()
var config_path = "user://settings.cfg"
var resolutionList:Dictionary

func get_savedData():

	if config.load(config_path) == OK:
		var data = config.get_value("Settings", "data", {})
		return {"message" : "loaded data",
				"data" : data}
	else:
		return {"message" : "default data",
				"data" : getDefaultSettings()}
	
func getDefaultSettings()->Dictionary:
	var data = {
		"button_volume": -20.0,
		"fullscreen": true,
		"master_volume": -20.0,
		"music_volume": -20.0,
		"mute": false,
		"mute_buttons": false,
		"mute_music": false,
		"resolution_index": 0
	}
	return data
