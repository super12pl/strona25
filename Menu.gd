extends Control

@onready var gracze = $MarginContainer/VBoxContainer/HBoxContainer/gracze
@onready var szeregi = $MarginContainer/VBoxContainer/HBoxContainer2/szeregi
@onready var kolumny = $MarginContainer/VBoxContainer/HBoxContainer3/kolumny

func _on_play_pressed():
	global.players = int(gracze.get_line(0))
	global.szeregi = int(szeregi.get_line(0))
	global.kolumny = int(kolumny.get_line(0))
	get_tree().change_scene_to_file("res://gameBoard.tscn")

func _on_exit_pressed():
	get_tree().quit()
