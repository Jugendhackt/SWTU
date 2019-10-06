extends "res://scripts/Level.gd"

export var railcount = 3
export var distMod = 10000
var bagScene = load("res://scenes/Plastic/BagSpawner.tscn")
var bagSoundFront = preload("res://scenes/Plastic/plastik_vorne.wav")
var bagSoundLeft = preload("res://scenes/Plastic/Plastik_links.wav")
var bagSoundRight = preload("res://scenes/Plastic/Plastik_rechts.wav")

var bagSounds = [bagSoundLeft,bagSoundFront,bagSoundRight]
var bags = []

var windowSizeX = OS.get_real_window_size().x
var windowSizeY = OS.get_real_window_size().y
var translateY = -windowSizeY/3/2
var offsetX: float = windowSizeX/(railcount*2)
var audioPlayers = [[],[],[]]

func _ready():
	for i in range(railcount):
		var streamPlayer = AudioStreamPlayer.new()
		streamPlayer.set_stream(bagSounds[i])
		add_child(streamPlayer)
		audioPlayers.append(streamPlayer)
		
	
	for i in range(railcount):
		var bagSpawner = bagScene.instance()
		var translateX = windowSizeX/railcount * i + offsetX
		
		bagSpawner.translate(Vector2(translateX,translateY))
		add_child(bagSpawner)
		
func _process(delta):
	for player in audioPlayers:
		var cBag
		var lastDist = 5000000
		for bag in bags[audioPlayers.find(player)]:
			var distance = sqrt(pow(bag.position.x,2) + pow(bag.position.y,2))
			if(distance < lastDist):
				cBag = bag
				lastDist = distance
		if cBag == null:
			return
			
		var distance = sqrt(pow(cBag.position.x,2) + pow(cBag.position.y,2))
		player.set_volume_db(distMod/distance)
		if(!player.isPlaying()):
			player.play()
		
	
func handlePlayerCollision(var collider: KinematicCollision2D):
	remove_child(collider.collider)
	
func level_end():
	finish()
	
func add_bag(bag,x):
	#for i in range(railcount):
	#	if rails[i] == x:
	#		bags[i].append(bag)
	#		break
	pass