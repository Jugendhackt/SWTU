extends Node2D

onready var timer = $LevelTimer

onready var badboy = load("res://scenes/BadBoy.tscn")
const dirs = ["Up", "Left", "Down", "Right"]

func _ready():
	randomize()
	random_bboy()

func random_bboy():
	var bbinst = badboy.instance()
	get_node("Spawn" + dirs[rand_range(0, dirs.size())]).add_child(bbinst)

func start_level(time):
	timer.start(time)

func _on_LevelTimer_timeout():
	print("YOU LOST!")
	
