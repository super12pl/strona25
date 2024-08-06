extends Control

func _ready():
	var gracz = load("res://scenes/gracz.tscn").instantiate()
	add_child(gracz)
	gracz.spawn(0)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes//Menu.tscn")
