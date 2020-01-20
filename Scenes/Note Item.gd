extends Node2D

var player
var printSpeed = 0
var distance

# Called when the node enters the scene tree for the first time.
func _ready():
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    player = get_node("/root/Main/Player")
    distance = position.distance_to(player.position)
    if (printSpeed == 10):
        print(player.position)
        print(position)
        print(distance)
        print("_________________")
        printSpeed = 0
    printSpeed += 1
    