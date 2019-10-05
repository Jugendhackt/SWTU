extends KinematicBody2D

var mTimer: Timer = get_children()[0]
export var waitRangeMin: float = 0
export var waitRangeMax: float = 1
export var mSpeed = 400
export var mSpawnX = 0
export var mSpawnY = 0
var direction = Vector2(0,1)
var rand = RandomNumberGenerator.new()

func _init(waitMin,waitMax,speed,spawnX,spawnY):
	waitRangeMin = waitMin
	waitRangeMax = waitMax
	mSpawnX = spawnX
	mSpawnY = spawnY
	mSpeed = speed

func _ready():
	var actualWaitTime = rand.randf_range(waitRangeMin,waitRangeMax)
	mTimer.wait_time = actualWaitTime
	mTimer.start()
	
func _physics_process(delta):
	if mTimer.time_left == 0:
		move_and_collide(direction * mSpeed * delta)