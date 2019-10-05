extends Node2D

onready var timer = $LevelTimer
onready var bar = $TimerBar
export var baseTime = 10

func _on_LevelTimer_timeout():
	print("Level Timeout")
	loose()

func _ready():
	var difficulty = Globals.get_difficulty()
	print("Level difficulty: " + str(difficulty))
	timer.start(baseTime*Globals.get_time_modifier())
	print("Level timer: " + str(timer.time_left))

func _process(delta):
	bar.value = timer.time_left / (baseTime * Globals.get_time_modifier()) * 100#

func finish():
	Globals.round_finished()
	Globals.random_level()

func adjust_to_difficulty():
	pass

func loose():
	print("You lost a life")
	Globals.lifes -= 1
	Globals.round_finished()
	Globals.random_level()
