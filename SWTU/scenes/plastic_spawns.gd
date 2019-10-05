extends Node

var windowSizeY = OS.get_real_window_size().y
var windowSizeX = OS.get_real_window_size().x

var spawnY = windowSizeY - windowSizeY/6
var spawnOffsetX = windowSizeX/6

func _ready():
	var children = get_children()
	for i in range(3):
		var spawnX = windowSizeX/3 * i + spawnOffsetX 
		var offset = Vector2(spawnX,spawnY)
		children[i].translate(offset)
	pass 