extends Node2D

var noteItem
var main
var player
var scrollSpeed = 0.35
var textArray = []
var noteIndex

# Called when the node enters the scene tree for the first time.
func _ready():
    visible = false
    for each in get_children():
        if each.get_class() == "RichTextLabel":
            textArray.append(each)
            each.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
    main = find_parent("Main")
    player = main.get_player()
    noteItem = main.get_noteItem()
    var tween = get_node("Tween")
    
    if (input() and !visible):
        noteIndex = noteItem.findNote()
        if(noteIndex != -1):
            textArray[noteIndex].visible = true
            player.freeze_player = true
            position = player.position + Vector2( 0 , 500 )
            visible = true
            tween.interpolate_property(self, "position", (player.position + Vector2( 0 , 275 )),
            player.position, scrollSpeed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
            tween.start()
    
    elif (input() and !tween.is_active()):
        visible = false
        player.freeze_player = false
        for each in textArray:
            each.visible = false
        
        
func input() -> bool:
    if (Input.is_action_just_pressed("action")):
        return true
    return false