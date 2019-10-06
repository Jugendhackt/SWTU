extends KinematicBody2D

export var hitLimit = 3
var hitCount = 0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var collisions = move_and_collide(Vector2(0,0))
	if(collisions):
		collisions.collider_shape.free()
		hitCount += 1
	if(hitCount >= hitLimit):
		get_parent().loose()