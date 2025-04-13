extends Node

@onready var BackgroundTrack: AudioStreamPlayer = $"background track"
@onready var hover_soound: AudioStreamPlayer = $"hover soound"
@onready var load_game_files: Node = $"../LoadGameFiles"

const bgmusic = preload("res://Assets/Sounds/gameBackground.mp3")
const buttonSound = preload("res://Assets/Sounds/hoverOver.mp3")

var hoverSoundVolume = -20.0
var savedSettings

func _ready() -> void:
	savedSettings = await load_game_files.get_savedData()["data"]


func change_master_volume(volume:float)->void:
	AudioServer.set_bus_volume_db(0,volume)

func master_volume_on()->void:
	AudioServer.set_bus_mute(0,false)

func master_volume_off()->void:
	AudioServer.set_bus_mute(0,true)


func _play_Bgmusic(music:AudioStream,volume = -20.0) :
	if BackgroundTrack.stream == music:
		return
	BackgroundTrack.stream = music
	BackgroundTrack.volume_db = volume
	BackgroundTrack.play()

func play_bg_music():
	_play_Bgmusic(bgmusic)

func change_music_volume(new_volume: float):
	BackgroundTrack.volume_db = new_volume

func music_off():
	BackgroundTrack.volume_db = -80.0

func music_on():
	BackgroundTrack.volume_db = savedSettings["music_volume"]

func _hover_sound(sound:AudioStream,volume = 0.0):
	hover_soound.stream = sound
	hover_soound.volume_db = volume
	hover_soound.play()

func hoverSound():
	_hover_sound(buttonSound,hoverSoundVolume)

func change_hover_Volume(new_volume:float):
	hoverSoundVolume=new_volume

func hoverSoundOn():
	hoverSoundVolume=savedSettings["button_volume"]
	
func hoverSoundOff():
	hoverSoundVolume=-80
