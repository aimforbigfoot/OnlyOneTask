extends Control

onready var main_label := $Label

func _ready() -> void:
	main_label.text = Global.user_string
