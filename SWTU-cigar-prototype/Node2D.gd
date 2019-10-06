extends Node2D

var random = null

var roundFinished = false
var selButton = ""

var player = AudioStreamPlayer.new()

func _on_finsh(var button):
	roundFinished = true
	selButton = button

# Called when the node enters the scene tree for the first time.
func _ready():
	random = randi()%4+1
	self.add_child(player)
	
	$left.connect("finish", self, "_on_finsh")
	$right.connect("finish", self, "_on_finsh")
	$top.connect("finish", self, "_on_finsh")
	$bottom.connect("finish", self, "_on_finsh")
	
	yield(get_tree().create_timer(0.2), "timeout")
	
	var dir = "res://zigarettenstampfen_"
	dir += String(random)
	dir += ".wav"
	player.stream = load(dir)
	
	if(random == 4):
		player.volume_db = 1
	else:
		player.volume_db = 11
	
	player.play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(player.playing):
		_deactivateBtns()
	else:
		_activateBtns()

	if(roundFinished == true):
		roundFinished = false
		
		if(random == 1):
			if(selButton == "left"):
				print("Left? Thats right!")
				correct()
			else:
				print("Thats false!")
				wrong()
				
		elif(random == 2):
			if(selButton == "right"):
				print("Right? Thats right!")
				correct()
			else:
				print("Thats false!")
				wrong()
				
		elif(random == 3):
			if(selButton == "top"):
				print("Top? Thats right!")
				correct()
			else:
				print("Thats false!")
				wrong()
		elif(random == 4):
			if(selButton == "bottom"):
				print("Bottom? Thats right!")
				correct()
			else:
				print("Thats false!")
				wrong()
				
		random = randi()%4+1
		
		yield(get_tree().create_timer(2.0), "timeout")
		
		var dir = "res://zigarettenstampfen_"
		dir += String(random)
		dir += ".wav"
		player.stream = load(dir)
		
		if(random == 4):
			player.volume_db = 1
		else:
			player.volume_db = 11
		
		player.play()
			

func correct():
	$Label.text = "CORRECT"
	$Label.modulate = Color(0, 1, 0.25098)
	$Label/Timer.start(1)

func wrong():
	$Label.text = "WRONG"
	$Label.modulate = Color(1, 0, 0)
	$Label/Timer.start(1)

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

func _on_LabelTimer_timeout():
	$Label.text = ""
