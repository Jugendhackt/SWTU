extends Node2D

var bagScene = load("res://scenes/Plastic/Tuete.tscn")
onready var mTimer = $mTimer
var rand = RandomNumberGenerator.new()

var diffOffset

func _ready():
	rand.randomize()
	var tMod = Globals.get_time_modifier()
	diffOffset = rand.randf_range(1 * tMod,10 * tMod)
	mTimer.start(diffOffset)
	pass 
	
func onTimeOut():
	var bag = bagScene.instance()
	get_parent().add_child(bag)
	bag.setPosition(position.x,position.y)
	bag.go()
	
	var tMod = Globals.get_time_modifier()
	diffOffset = rand.randf_range(4 * tMod,30 * tMod)
	mTimer.start(diffOffset)