extends Node2D

var main

# Called when the node enters the scene tree for the first time.
func _ready():
    main = find_parent("Main")
    main._ready()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
