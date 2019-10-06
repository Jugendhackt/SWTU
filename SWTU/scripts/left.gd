extends Button

var ready = true

signal finish

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("../").connect("btns_ready", self, "_on_ready")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _pressed():
	if(ready):
		get_node("../")._deactivateBtns()
		emit_signal("finish", "left")
		ready = false

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_LEFT:
			if(ready):
				get_node("../")._deactivateBtns()
				emit_signal("finish", "left")
				ready = false

func _on_ready():
	ready = true