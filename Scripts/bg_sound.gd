extends AudioStreamPlayer

func _ready():
	play()

func _process(delta):
	
	if not playing:
		play()
