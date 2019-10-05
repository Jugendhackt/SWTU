extends KinematicBody2D

export var speed = 1000
var go = false

var direction = Vector2(0,1)
var rand = RandomNumberGenerator.new()

func _init(waitMin,waitMax,speed,spawnX,spawnY):
	waitRangeMin = waitMin
	waitRangeMax = waitMax
	mSpawnX = spawnX
	mSpawnY = spawnY
	mSpeed = speed

func _ready():
	pass
	
func setPosition(x,y):
	translate(Vector2(x,y))
	
func setSpeed(s):
	speed = s
	
func go():
	go = true
	
func _physics_process(delta):
<<<<<<< HEAD
	if go:
		move_and_collide(direction * speed * delta)
=======
	if mTimer.time_left == 0:
		move_and_collide(direction * mSpeed * delta)
>>>>>>> b79b466c1d539b510befab433ca6cd8e6bc46da6
