extends KinematicBody2D

var screen_size
var animCheck
var velocity
var collision
var moveSpeed = 60
var freeze_player = false

func _ready():
    screen_size = get_viewport_rect().size
    animCheck = false

func _physics_process(delta):
    
    if (freeze_player):
        $AnimationPlayer.stop()
        $Sprite.rotation_degrees = 0
        return
    
    velocity = Vector2()  # The player's movement vector.
    
    if Input.is_action_pressed("right"):
        velocity.x += moveSpeed
        $Sprite.flip_h = true
    if Input.is_action_pressed("left"):
        velocity.x -= moveSpeed
        $Sprite.flip_h = false
    if Input.is_action_pressed("down"):
        velocity.y += moveSpeed
    if Input.is_action_pressed("up"):
        velocity.y -= moveSpeed
        
    if velocity.length() > 0:
        velocity = move_and_slide(velocity)
        
        if !animCheck:
            $AnimationPlayer.play("wobble")
            animCheck = true
    else:
        $AnimationPlayer.stop()
        $Sprite.rotation_degrees = 0
        animCheck = false
        

    position += velocity * delta

func getVelocity():
    return velocity