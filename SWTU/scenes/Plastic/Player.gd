extends KinematicBody2D
export var speed = 1200

var windowSizeX = OS.get_real_window_size().x
var windowSizeY = OS.get_real_window_size().y
var offsetX = windowSizeX/6
var mState = 0
var tortoise = preload("res://scenes/Plastic/Schildkröte.png")
export var human = false

var playerLeft = preload("res://scenes/Plastic/Plastik/PlayerLeft.png")
var playerWalking = preload("res://scenes/Plastic/Plastik/PlayerRight.png")
var player = preload("res://scenes/Plastic/Plastik/Player.png")

var moving_left = -1
var standing = 0
var moving_right = 1
var target = 1

var rails = []

func getInput():
	if Input.is_action_just_pressed("ui_left"):
		mState = moving_left
		if human:
			$sprite.set_texture(playerWalking)
			$sprite.set_flip_h(true)
		if target > 0:
			target -= 1
	if Input.is_action_just_pressed("ui_right"):
		mState = moving_right
		if human:
			$sprite.set_texture(playerWalking)
			$sprite.set_flip_h(false)
		if target < 2:
			target += 1

func _ready():
	if human:
		$sprite.set_texture(player)
	else:
		$sprite.set_texture(tortoise)
		
	for i in range(3):
		rails.append(windowSizeX/3 * i + offsetX)
	rotate(deg2rad(180))
	
func _physics_process(delta):
	getInput()
	
	if(position.x <= rails[target] and mState == moving_left):
		mState = standing
	elif(position.x >= rails[target] and mState == moving_right):
		mState = standing
	if mState == standing and human and $sprite.get_texture() != player:
		$sprite.set_texture(player)
		$sprite.set_flip_h(false)
		
	var moveVector = Vector2(mState,0) * speed
	var collision = move_and_collide(moveVector * delta)
	if collision:
		get_parent().handlePlayerCollision(collision)
	