extends KinematicBody2D

var mTimer: Timer = get_children()[0]
export var waitRangeMin: float = 0
export var waitRangeMax: float = 1
export var speed = 400
export var spawnX = 0
export var spawnY = 0
var direction = Vector2(0,1)
var initialized = false
var rand = RandomNumberGenerator.new()

func _ready():
	var actualWaitTime = rand.randf_range(waitRangeMin,waitRangeMax)
	mTimer.wait_time = actualWaitTime
	mTimer.start()
	
func _physics_process(delta):
	if mTimer.time_left == 0:
		move_and_collide(direction * speed * delta)