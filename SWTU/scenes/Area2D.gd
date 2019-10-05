extends Area2D

func _ready():
	pass


func _physics_process(delta):
	if get_overlapping_areas().size() > 0:
		print("Boop")
		#load death screen 