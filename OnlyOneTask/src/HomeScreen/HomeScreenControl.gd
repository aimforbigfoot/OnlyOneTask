extends Control

onready var lineedit := $VBoxContainer/HBoxContainer/lineEdit_main
onready var cp_lbl := $VBoxContainer/VBoxContainer/copyright_label
onready var slider_info_label := $VBoxContainer/VBoxContainer2/slider_info_label

func _ready() -> void:
	var curr_year : int = OS.get_date().year
	cp_lbl.text = ("Copyright: NAD LABS " + str(curr_year))


func _on_submit_button_pressed() -> void:
	submit_func()



func submit_func() -> void:
	if lineedit.text.length() >= 30:
		OS.alert("""That task length is too long, try something shorter?\n
		Under 30 characters is the sweet spot.\n
		Keeps the window size perfect! Sorry about this.""", "Hey there buddy, slow down!")
		lineedit.FOCUS_NONE
	else:
		OS.set_window_always_on_top(true)
		OS.set_window_size(Vector2(192,108))
		Global.user_string = lineedit.text
		get_tree().change_scene("res://src/taskScreen/TaskScreen.tscn")
		pass


func _on_HSlider_value_changed(value: float) -> void:
	slider_info_label.text = ("I will flash your reminder in " + str(value) + " minutes")
	Global.user_time = value
