extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
var flip


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.



func _process(delta):
    if (frame == 1):
        if (flip == true):
            flip_h = !flip_h
        flip = false
    else:
        flip = true

