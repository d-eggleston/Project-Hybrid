extends Node2D

var player setget , get_player
var noteItem setget , get_noteItem

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func get_player():
    return find_node("Player")
    
func get_noteItem():
    return find_node("Notes")

