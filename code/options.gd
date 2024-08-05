extends Control
@onready var options = $"."
@onready var width = $MarginContainer/VBoxContainer/Resolution/VBoxContainer/Width/width
@onready var height = $MarginContainer/VBoxContainer/Resolution/VBoxContainer/Height/height
@onready var windowed = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/windowed
@onready var borderless = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/borderless
var display := ""

# Called when the node enters the scene tree for the first time.
func _ready():
	options.size = Vector2i(get_window().size.x,get_window().size.y)
	width.text = str(get_window().size.x)
	height.text = str(get_window().size.y)
	
func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes//Menu.tscn")

func _on_apply_pressed():
	global.width = int(width.text)
	global.height = int(height.text)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED) if display == "borderless" else DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	get_window().size = Vector2i(int(width.text),int(height.text))

func _on_windowed_toggled(toggled_on):
	display = "windowed"

func _on_borderless_toggled(toggled_on):
	display = "borderless"
