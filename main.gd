extends Node

func _ready() -> void:
	GameManager.sounds.play_bg_music()
	var data = GameManager.loadGameFiles.get_savedData()
	print("current settings", data)
	
	await GameManager.splashScreen.run()
	GameManager.navigation.to_mainmenu()
