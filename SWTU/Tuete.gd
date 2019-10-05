extends KinematicBody2D

export var speed = 1000
var go = false
var direction = Vector2(0,1)
var rand = RandomNumberGenerator.new()

func _ready():
	pass
	
func setPosition(x,y):
	translate(Vector2(x,y))
	
func setSpeed(s):
	speed = s
	
func go():
	go = true
	
func _physics_process(delta):
	if go:
		move_and_collide(direction * speed * delta)
