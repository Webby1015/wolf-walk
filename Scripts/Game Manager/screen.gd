extends Node

var commonResolutions = [[1920,1080],[1600,900],[1280,720],[1152,648]]
var ResolutionList = {}

func getScreenResolutions() -> Dictionary:
	var resolution = DisplayServer.screen_get_size()
	ResolutionList[0] = [resolution.x, resolution.y]
	return ResolutionList
	
func changeResolution(x:int,y:int) -> void:
	DisplayServer.window_set_size(Vector2i(x,y))

func fullScreen()->void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		
func windowed()->void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
