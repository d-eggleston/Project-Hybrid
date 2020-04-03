extends Light2D
var input
var target = 360
var rot = 360
var player
var main
var actionPrompt
var hasItem
var distancetoPlayer
var startRot
var increment
var loopcount
var speedfactor = 12
var lightOffset = 90

func _ready():
    #visible = false
    hasItem = false
    main = find_parent("Main")
    player = get_parent()
    actionPrompt = main.get_actionKeyIcon()
    
func _physics_process(delta):
    distancetoPlayer = main.get_flashItem().position.distance_to(player.getPos())
    
    #Code for collecting the flashlight item
    if (!hasItem and distancetoPlayer < 18):
        if (!actionPrompt.visible):
            actionPrompt.on(self)
        if Input.is_action_just_pressed("action"):
            actionPrompt.off(self)
            main.unload(main.get_flashItem())
            hasItem = true
            visible = true
    elif (distancetoPlayer > 18):
        actionPrompt.off(self)
        
    #Stops the flashlight from moving if the player is frozen
    if(player.freeze_player):
        return
    
    #Check for input and assign the corresponding target value and start rotation
    input = rad2deg(player.getVelocity().normalized().angle())
    if Input.is_action_pressed("right") or input != 0:
        target = int(input) + 180
        startRot = true
    
    rotation_degrees = rot - 180 + lightOffset
    loopcount = 0
    
    #Calculations for the flashlight's rotation
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
    
    