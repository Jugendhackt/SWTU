extends "res://scripts/Level.gd"

export var railcount = 3
var bagScene = load("res://scenes/BagSpawner.tscn")

var windowSizeX = OS.get_real_window_size().x
var windowSizeY = OS.get_real_window_size().y
var translateY = -windowSizeY/3/2
var offsetX: float = windowSizeX/(railcount*2)
var rand = RandomNumberGenerator.new()

func _ready():
	rand.randomize()
	for i in range(railcount):
		var bagSpawner = bagScene.instance()
		var translateX = windowSizeX/railcount * i + offsetX
		
		bagSpawner.translate(Vector2(translateX,translateY))
		add_child(bagSpawner)
		
func _physics_process(delta):
	pass