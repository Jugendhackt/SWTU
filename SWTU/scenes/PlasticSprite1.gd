extends Sprite

var windowSizeX = OS.get_real_window_size()

var spawnY = -OS.get_real_window_size()/6
var spawnX = windowSizeX/6

func _ready():
	var offset = Vector2(spawnX,spawnY)
	get_parent().translate(offset)
