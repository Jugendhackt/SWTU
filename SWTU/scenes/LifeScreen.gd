extends Node2D

func _ready():
	$RoundLabel.text = "Round " + str(Globals.round_counter)