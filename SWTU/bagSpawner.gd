extends Node2D

var bagScene = load("res://scenes/Tuete.tscn")
onready var mTimer = $mTimer
var rand = RandomNumberGenerator.new()
var timeMin = 15
var timeMax = 50

var difficulty
var diffOffset

func _ready():
	rand.randomize()
	var tMod = Globals.get_time_modifier()
	diffOffset = rand.randf_range(1 * tMod,10 * tMod)
	mTimer.start(diffOffset)
	pass 
	
func setTimes(var times):
	timeMin = times[0]
	timeMax = times[1]
	
func onTimeOut():
	var bag = bagScene.instance()
	get_parent().add_child(bag)
	bag.setPosition(position.x,position.y)
	bag.go()
	
	var tMod = Globals.get_time_modifier()
	diffOffset = rand.randf_range(4 * tMod,30 * tMod)
	mTimer.start(diffOffset)