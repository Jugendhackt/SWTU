extends KinematicBody2D
export var speed = 200

var windowSizeX = OS.get_real_window_size().x
var windowSizeZ = OS.get_real_window_size().y
var mState = 1

var moving_left = 0
var standing = 1
var moving_right = 2

var rails = []

func getInput():
	var target = position.x
	if(Input.is_action_pressed("ui_left")):
		mState = moving_left
		for rail in rails:
			if rail < position.x:
				target = rail
	if(Input.is_action_pressed("ui_right")):
		mState = moving_right
		for rail in rails:
			if rail > position.x:
				target = rail
				break

func _ready():
	for i in range(get_parent().railcount):
		rails.append(windowSizeX/3 * i + get_parent().offsetX)
	
