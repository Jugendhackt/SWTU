extends Node

var windowSizeY = OS.get_real_window_size().y
var windowSizeX = OS.get_real_window_size().x
var spawnY = windowSizeY/6
var rng = RandomNumberGenerator.new()
var plasticBags = []
var bagTexture = load("res://icon.png")

func _ready():
	var children = get_children()
		
	for i in range(get_parent().railcount):
		var spawnX = windowSizeX/3 * i + get_parent().offsetX
		var offset = Vector2(spawnY,spawnX)
		children[i].translate(offset)
	
	spawnPlasticBag()
		
func spawnPlasticBag():
	var plasticBag = get_parent().get_children()[1].duplicate()
	plasticBag.position.x = 0
	
	plasticBags.append(plasticBag)
	pass