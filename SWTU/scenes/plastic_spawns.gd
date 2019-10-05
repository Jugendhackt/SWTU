extends Node

var windowSizeY = OS.get_real_window_size().y
var windowSizeX = OS.get_real_window_size().x
var spawnY = windowSizeY - windowSizeY/6

func _ready():
	var children = get_children()
	
	for i in range(get_parent().railcount):
		var spawnX = windowSizeX/3 * i + get_parent().offsetX
		var offset = Vector2(spawnY,spawnX)
		children[i].translate(offset)