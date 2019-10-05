extends "res://scripts/Level.gd"

export var railcount = 3

var windowSizeX = OS.get_real_window_size().x
var windowSizeY = OS.get_real_window_size().y
export var offsetX: float = windowSizeX/(railcount*2)
var mTimer = Timer.new()

func _ready():
	pass