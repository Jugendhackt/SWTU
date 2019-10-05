extends KinematicBody2D
var windowSizeX = OS.get_real_window_size().x

var spawnY = -OS.get_real_window_size().y/6
var spawnX = windowSizeX/3 * 2 + windowSizeX/6
export var speed = 400
var acSpeed = 0
var mTimer = Timer.new()
var rand = RandomNumberGenerator.new()

func _ready():
	#call_deferred("add_child",mTimer)
	var offset = Vector2(spawnX,spawnY)
	mTimer.wait_time = rand.randf_range(2,3)
	translate(offset)
	mTimer.start()
	
func _physics_process(delta):
	if mTimer.time_left == 0:
		acSpeed = speed
	var direction = Vector2(0,acSpeed)
	move_and_collide(direction*delta)