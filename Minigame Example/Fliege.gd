extends KinematicBody2D

export var startVel = Vector2()
var vel = Vector2()

func _ready():
	vel = startVel

func _physics_process(delta):
	vel = move_and_slide(vel)

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if (event.is_pressed() and event.button_index == BUTTON_LEFT):
			queue_free()


func _on_Area2D_mouse_entered():
	pass # Replace with function body.
