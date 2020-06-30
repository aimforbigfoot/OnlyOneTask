extends Node2D

onready var timer := $Timer
export var speed_multi := 20
onready var user_label := $TaskScreenControl/Label

func _ready() -> void:
	timer.start(Global.user_time*60)
	var screensize := OS.get_screen_size()
	var window_screen_size := OS.get_window_size()
	OS.window_position = Vector2((screensize.x/2-window_screen_size.x/2),(screensize.y-window_screen_size.y))
	get_tree().get_root().set_transparent_background(true) 
	OS.window_per_pixel_transparency_enabled = true
	OS.alert("""		!PLEASE READ!
QUICK USER GUIDE\n
Use the esc(escape) key to exit (escape) the program\n
Use the e key to (e)dit the text\n
To move the text around, click on the letter and use the arrow keys\n
(or WASD if your a gamer)\n
		Enjoy using the program!
	""")


func _input(event: InputEvent) -> void:
	var vel : Vector2 = Vector2.ZERO
	vel.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	vel.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	OS.window_position += vel*speed_multi
	
	if event.is_action_pressed("escape_key"):
		get_tree().quit()
	elif event.is_action_pressed("edit_key"):
		get_tree().change_scene("res://src/HomeScreen/HomeScreen.tscn")
	
	if event.is_action_pressed("ui_page_down"):
		flashtext()

func _on_Timer_timeout() -> void:
	timer.start(Global.user_time*60)
	flashtext()

func flashtext() -> void:
	user_label.modulate = Color("f80102")
	yield(get_tree().create_timer(1.0), "timeout")
	user_label.modulate = Color("ffffff")
	yield(get_tree().create_timer(1.0), "timeout")
	user_label.modulate = Color("f80102")
	yield(get_tree().create_timer(1.0), "timeout")
	user_label.modulate = Color("ffffff")
