extends Node

export var lives = 3
export var time_modifier = 1
export var round_counter = 0

func round_finished():
	round_counter += 1

func get_time_modifier():
	return pow(0.95, round_counter)

func get_difficulty():
	return 10 + round_counter * 10 + pow(round_counter, 1.3)