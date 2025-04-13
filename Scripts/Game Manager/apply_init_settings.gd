extends Node
@onready var load_game_files: Node = $"../LoadGameFiles"
@onready var sounds: Node = $"../sounds"
@onready var screen: Node = $"../screen"

var data

func apply() -> void:
	data = load_game_files.get_savedData()["data"]
	sounds.change_master_volume(data["master_volume"])
	if data["mute"]:
		sounds.master_volume_off()
	else:
		sounds.master_volume_on()
	
	sounds.change_music_volume(data["music_volume"])
	if data["mute_music"]:
		sounds.music_off()
	else:
		sounds.music_on() 
		
	sounds.change_hover_Volume(data["button_volume"])
	if data["mute_buttons"]:
		sounds.hoverSoundOff()
	else:
		sounds.hoverSoundOn() 
	
	var resList = screen.getScreenResolutions()
	var x = resList[data["resolution_index"]][0]
	var y = resList[data["resolution_index"]][1]
	screen.changeResolution(x,y)
	
	if data["fullscreen"]:
		screen.fullScreen()
	else:
		screen.windowed() 
	
#func _ready() -> void:
	#data = load_game_files.get_savedData()
	#print(data)
