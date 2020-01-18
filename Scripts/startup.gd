extends Node

func _ready():
    var root = get_tree().get_root()
    root.connect("size_changed", self, "resize")
    OS.set_window_fullscreen(true)
    set_process_input(true)
    
func resize():
    var root = get_tree().get_root()
    var resolution = root.get_visible_rect()
    print(resolution)
    
func _input(event):
    if(event is InputEventKey and event.get_scancode() == KEY_ESCAPE):
        OS.set_window_fullscreen(false)