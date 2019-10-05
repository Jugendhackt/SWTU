extends Node2D

onready var timer = $LevelTimer

func _on_LevelTimer_timeout():
	print("Level Timeout")
	loose()

func _ready():
	timer.start(2)

func loose():
	pass
