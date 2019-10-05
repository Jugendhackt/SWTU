extends KinematicBody2D
export var speed = 300

var windowSizeX = OS.get_real_window_size().x
var windowSizeZ = OS.get_real_window_size().y
var mState = 0

var moving_left = -1
var standing = 0
var moving_right = 1
var target = 1

var rails = []

func getInput():
	if Input.is_action_just_pressed("ui_left"):
		mState = moving_left
		if target > 0:
			target -= 1
	if Input.is_action_just_pressed("ui_right"):
		mState = moving_right
		if target < 2:
			target += 1

func _ready():
	for i in range(3):
		rails.append(windowSizeX/3 * i + get_parent().offsetX)
	rotate(deg2rad(180))
	
func _physics_process(delta):
	getInput()
	
	if(position.x <= rails[target] and mState == moving_left):
		mState = standing
	elif(position.x >= rails[target] and mState == moving_right):
		mState = standing 
		
	var moveVector = Vector2(mState,0) * speed
	move_and_collide(moveVector * delta)