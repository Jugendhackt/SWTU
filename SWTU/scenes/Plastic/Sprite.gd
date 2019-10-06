extends Sprite

var startX = OS.get_real_window_size().x / 2
var startY = OS.get_real_window_size().y * 1.9
export var picturePath = "res://scenes/Plastic/Schildkröte"

func _ready():
	var startPosition = Vector2(startX,startY)
	get_parent().translate(startPosition)
	rotate(deg2rad(180))
