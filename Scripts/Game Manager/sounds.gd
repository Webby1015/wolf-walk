extends Node

const bgmusic = preload("res://Assets/Sounds/gameBackground.mp3")
const buttonSound = preload("res://Assets/Sounds/hoverOver.mp3")

@onready var BackgroundTrack: AudioStreamPlayer = $"background track"
@onready var hover_soound: AudioStreamPlayer = $"hover soound"

var defaultSettings = {
	"MasterVolume":-10.0,
	"MusicVolume":0.0,
	"ButtonVolume":0.0,
	"MuteMaster":false,
	"MuteMusic":false,
	"MuteButton":false,
	"resolution":3,
	"fullScreen":true
	}

func _play_Bgmusic(music:AudioStream,volume = 0.0) :
	if BackgroundTrack.stream == music:
		return
	BackgroundTrack.stream = music
	BackgroundTrack.volume_db = volume
	BackgroundTrack.play()
	
func play_bg_music():
	_play_Bgmusic(bgmusic)
	
func change_music_volume(new_volume: float):
	BackgroundTrack.volume_db = new_volume
	
func mute_music():
	if BackgroundTrack.volume_db!=0.0:
		BackgroundTrack.volume_db = -80
		return true
	else:
		BackgroundTrack = defaultSettings["MusicVolume"]
		return false

func _hover_sound(sound:AudioStream,volume = 0.0):
	hover_soound.stream = sound
	hover_soound.volume_db = volume
	hover_soound.play()

func hoverSound():
	_hover_sound(buttonSound)

func change_hover_Volume(new_volume:float):
	hover_soound.volume_db=new_volume
