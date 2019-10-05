extends Node

export var tuetenCount = 3
var mTueten = []
var tuete = load("res://scenes/Tuete.tscn")

func _ready():
	for i in range (tuetenCount):
		mTueten.append(tuete.instance())