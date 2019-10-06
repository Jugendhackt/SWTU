extends "res://scripts/Level.gd"

onready var badboy = load("res://scenes/BadBoy.tscn")
const dirs = ["Up", "Left", "Down", "Right"]

var random = null
var success = 0
var success_min = 0

var roundFinished = false
var selButton = ""

var player = AudioStreamPlayer.new()

signal btns_ready

func _on_finsh(var button):
	roundFinished = true
	selButton = button

func _ready():
	._ready()
	randomize()
	random_bboy()
	
	success_min = 2 + int(Globals.get_difficulty() / 40)
	
	random = randi()%4+1
	self.add_child(player)
	
	$left.connect("finish", self, "_on_finsh")
	$right.connect("finish", self, "_on_finsh")
	$top.connect("finish", self, "_on_finsh")
	$bottom.connect("finish", self, "_on_finsh")
	
	yield(get_tree().create_timer(0.2), "timeout")
	
	var dir = "res://sounds/zigarettenstampfen_"
	dir += String(random)
	dir += ".wav"
	player.stream = load(dir)
	
	if(random == 4):
		player.volume_db = 1
	else:
		player.volume_db = 11
	
	player.play()

func random_bboy():
	var bbinst = badboy.instance()
	get_node("Spawn" + dirs[rand_range(0, dirs.size())]).add_child(bbinst)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(roundFinished == true && !player.playing):
		roundFinished = false
		_activateBtns()
		
		emit_signal("btns_ready")
		
		if(random == 1):
			if(selButton == "left"):
				print("Left? Thats right!")
				correct()
			else:
				print("Thats false!")
				
		elif(random == 2):
			if(selButton == "right"):
				print("Right? Thats right!")
				correct()
			else:
				print("Thats false!")
				
		elif(random == 3):
			if(selButton == "top"):
				print("Top? Thats right!")
				correct()
			else:
				print("Thats false!")
				
		elif(random == 4):
			if(selButton == "bottom"):
				print("Bottom? Thats right!")
				correct()
			else:
				print("Thats false!")
				
		random = randi()%4+1
		
		yield(get_tree().create_timer(2.0), "timeout")
		
		var dir = "res://sounds/zigarettenstampfen_"
		dir += String(random)
		dir += ".wav"
		player.stream = load(dir)
		
		if(random == 4):
			player.volume_db = 1
		else:
			player.volume_db = 11
		
		player.play()
			
func _deactivateBtns():
	$right.disabled = true
	$left.disabled = true
	$top.disabled = true
	$bottom.disabled = true
	
func _activateBtns():
	$right.disabled = false
	$left.disabled = false
	$top.disabled = false
	$bottom.disabled = false

func correct():
	success += 1
	if success >= success_min:
		Globals.round_finished(false)
		Globals.random_level()