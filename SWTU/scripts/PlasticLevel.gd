extends "res://scripts/Level.gd"

export var railcount = 3
var rails = []

var windowSizeX = OS.get_real_window_size().x
var windowSizeY = OS.get_real_window_size().y
var offsetX = windowSizeX/(railcount*2)

func _ready():
	for i in range(railcount):
		rails.append(windowSizeX/3 * i + offsetX)