extends Light2D
var input
var target = 360
var rot = 360
var player
var main
var hasItem
var startRot
var increment
var loopcount
var speedfactor = 12
var lightOffset = 90

func _ready():
    visible = false
    hasItem = false
    main = find_parent("Main")
    pass
    
func _physics_process(delta):
    player = get_parent()
    
    if (!hasItem and main.get_flashItem().position.distance_to(player.getPos()) < 5):
        main.unload(main.get_flashItem())
        hasItem = true
        visible = true
    
    if(player.freeze_player):
        return
    
    input = rad2deg(player.getVelocity().normalized().angle())
    if Input.is_action_pressed("right") or input != 0:
        target = int(input) + 180
        startRot = true
    
    rotation_degrees = rot - 180 + lightOffset
    loopcount = 0
    
    if startRot:
        if target - rot < 180 and target - rot > 0:
            increment = true
        elif target - rot < 0 and target - (rot - 360) < 180:
            increment = true
        else:
            increment = false
        while loopcount < speedfactor:
            if target == rot:
                startRot = false
                break
            if increment:
                if rot == 360:
                    rot = 1
                else:
                    rot = rot + 1
            else:
                if rot == 1:
                    rot = 360
                else:
                    rot = rot - 1
            loopcount = loopcount + 1
    
    