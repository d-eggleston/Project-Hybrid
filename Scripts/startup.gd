extends Node

func _ready():
    var root = get_tree().get_root()
    root.connect("size_changed", self, "resize")
    OS.set_window_fullscreen(true)
    set_process_input(true)
    
func resize():
# warning-ignore:unused_variable
    var root = get_tree().get_root()
    
# warning-ignore:unused_argument
func _process(delta):
    if(Input.is_action_pressed("Alt") and Input.is_action_just_pressed("Enter")):
        if (OS.window_fullscreen):
            OS.set_window_fullscreen(false)
        else:
            OS.set_window_fullscreen(true)
    if(Input.is_action_just_pressed("Escape")):
        get_tree().quit()