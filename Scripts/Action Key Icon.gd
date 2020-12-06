extends Node2D

var main
var actionKeyon = false
var nodeArray = []
var noLight;

# Called when the node enters the scene tree for the first time.
func _ready():
    visible = false
    main = find_parent("Main")
    find_node("RichTextLabel").text = InputMap.get_action_list("action")[0].as_text()

# warning-ignore:unused_argument
func _process(delta):
    if nodeArray.size() > 0:
        visible = true
    elif (visible):
        visible = false

#These functions rely on the script executing them to check visiblity, 
#otherwise it will continue to inrement/decrement every frame
func off(node):
    if (nodeArray.find(node.name) == -1):
        return
    else:
        nodeArray.erase(node.name)
        return
        
func on(node):
    if (nodeArray.find(node.name) == -1):
        nodeArray.push_back(node.name)
    return
    

