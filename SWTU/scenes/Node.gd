extends Node

export var tuetenCount = 3
var mTueten = []
<<<<<<< HEAD
var tuetenScene = load("res://scenes/Tuete.tscn")
var windowSizeX = OS.get_real_window_size().x
var windowSizeY = OS.get_real_window_size().y
var offsetX = windowSizeX/6

func _ready():
	for i in range (tuetenCount):
		var waitMin = 0.5*i
		var waitMax = 0.5*i+0.5
		var speed = 400
		var spawnX = windowSizeX/3 * i + offsetX
		var spawnY = -windowSizeY/6
		var tuete = tuetenScene.instance()
		var timer = Timer.new()
		timer.connect("timeout",tuete,"go")
		get_parent().add_child(timer)
		
		timer.start()
		tuete.setPosition(spawnX,-spawnY);
		tuete.setSpeed(speed)
		
		get_parent().add_child(tuete)
		mTueten.append(tuete)
=======
var tuete = load("res://scenes/Tuete.tscn")

func _ready():
	for i in range (tuetenCount):
		mTueten.append(tuete.instance())
>>>>>>> b79b466c1d539b510befab433ca6cd8e6bc46da6
