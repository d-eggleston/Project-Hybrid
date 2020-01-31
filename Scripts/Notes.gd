extends Node2D

var player
var printSpeed = 0
var distance
var count
var main
var actionPrompt

# Called when the node enters the scene tree for the first time.
func _ready():
    main = find_parent("Main")
    actionPrompt = main.get_actionKeyIcon()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if (findNote() != -1):
        actionPrompt.on(self)
    
    elif (findNote() == -1):
        actionPrompt.off(self)

func findNote() -> int:
    count = 0
    player = main.get_player()
    for each in get_children():
        distance = each.position.distance_to(player.position)
        if (distance < 15):
            return count
        count += 1
    return -1