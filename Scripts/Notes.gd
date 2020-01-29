extends Node2D

var player
var printSpeed = 0
var distance
var count

# Called when the node enters the scene tree for the first time.
func _ready():
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):

func findNote() -> int:
    count = 0
    player = find_parent("Main").get_player()
    for each in get_children():
        distance = each.position.distance_to(player.position)
        if (distance < 15):
            return count
        count += 1
    return -1