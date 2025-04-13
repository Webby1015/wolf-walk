extends Node

var commonResolutions = [[1920,1080],[1600,900],[1280,720],[1152,648]]
var ResolutionList = {}

func getScreenResolutions() -> Dictionary:
	var resolution = DisplayServer.screen_get_size()
	var key_count = 0
	ResolutionList[0] = [resolution.x, resolution.y]
	for i in range(commonResolutions.size()):
		if commonResolutions[i] == [resolution.x, resolution.y]:
			continue
		elif commonResolutions[i] != [resolution.x, resolution.y]:
			key_count +=1
			ResolutionList[key_count] = commonResolutions[i]

	return ResolutionList
		
func changeResolution(x:int,y:int) -> void:
	DisplayServer.window_set_size(Vector2i(x,y))

func fullScreen()->void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		
func windowed()->void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
