extends Node2D

onready var tree = load("res://scenes/Tree.tscn")

func _ready():
	$RoundLabel.text = "Round " + str(Globals.round_counter)
	for i in range(3):
		$LifeAnchor.add_child(tree.instance())