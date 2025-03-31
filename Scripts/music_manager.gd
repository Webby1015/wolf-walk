extends AudioStreamPlayer

const bgmusic = preload("res://Assets/Sounds/gameBackground.mp3")

func _play_music(music:AudioStream,volume = 0.0) :
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()
	
func play_bg_music():
	_play_music(bgmusic)
	
func change_volume(new_volume: float):
	volume_db = new_volume
