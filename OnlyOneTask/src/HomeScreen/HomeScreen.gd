extends Node2D

func _ready() -> void:
	var screensize := OS.get_screen_size()
	get_tree().get_root().set_transparent_background(false) 
	OS.set_window_always_on_top(false)
	OS.set_window_size(Vector2(640,360))
	var windowsize := OS.get_window_size()
	OS.window_position = screensize/2 - windowsize/2


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("escape_key"):
		get_tree().quit()

