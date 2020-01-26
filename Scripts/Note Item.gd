extends Node2D

var player
var printSpeed = 0
var distance
var isPlayerNear = false setget , isPlayerNear

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
    
	
func isPlayerNear():
	player = find_parent("Main").get_player()
	distance = position.distance_to(player.position)
	if (distance < 15):
		isPlayerNear = true
	return isPlayerNear
