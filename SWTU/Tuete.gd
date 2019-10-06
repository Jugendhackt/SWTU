extends KinematicBody2D

export var speed = 1000
var go = false

var direction = Vector2(0,1)
var rand = RandomNumberGenerator.new()
var mAudio = AudioStreamPlayer2D.new()

func _ready():
	mAudio.set_stream(load("res://scenes/Plastic/zigarettenstampfen_1.wav"))
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