extends Node2D

var player
var noteItem
var flashItem
var actionKeyIcon

func _ready():
    #actionKeyIcon = find_node("Action Prompt")
    player = find_node("Player")
    noteItem = find_node("Notes")
    flashItem = find_node("Flashlight Item")
    getallnodes(self)

#func _process(delta):
    
func get_player():
    return player
    
func get_noteItem():
    return noteItem
    
func get_flashItem():
    return flashItem
    
func get_actionKeyIcon():
    if (actionKeyIcon == null):
        actionKeyIcon = find_node("Action Prompt")
    return actionKeyIcon
    
func unload(node):
    var children = node.get_children()
    
    node.visible = false
    
    for each in children:
        if (each.get_class() == "CollisionShape2D"):
            each.disabled = true
    return
    
func getallnodes(node):
    for N in node.get_children():
        if N.get_child_count() > 0:
            print("["+N.get_name()+"]")
            getallnodes(N)
        else:
            # Do something
            print("- "+N.get_name())
