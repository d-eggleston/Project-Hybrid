extends KinematicBody2D

var screen_size
var animCheck
var velocity
var collision
var moveSpeed = 60
var diagMoveSpeed = 0.7
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
    
    var right = Input.is_action_pressed("right")
    var left = Input.is_action_pressed("left")
    var up = Input.is_action_pressed("up")
    var down = Input.is_action_pressed("down")
    
    if right:
        if up or down:
            velocity.x += moveSpeed * diagMoveSpeed
        else:
            velocity.x += moveSpeed
        $Sprite.flip_h = true
    if left:
        if up or down:
            velocity.x -= moveSpeed * diagMoveSpeed
        else:
            velocity.x -= moveSpeed
        $Sprite.flip_h = false
    if down:
        if right or left:
            velocity.y += moveSpeed * diagMoveSpeed
        else:
            velocity.y += moveSpeed
    if up:
        if right or left:
            velocity.y -= moveSpeed * diagMoveSpeed
        else:
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
    
func getPos():
    return (position + Vector2( 0 , 12))
    
    
    
    