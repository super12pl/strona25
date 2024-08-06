extends Control

@onready var gracze = $MarginContainer/VBoxContainer/HBoxContainer/gracze
@onready var szeregi = $MarginContainer/VBoxContainer/HBoxContainer2/szeregi
@onready var kolumny = $MarginContainer/VBoxContainer/HBoxContainer3/kolumny

func _ready():
	gracze.text = str(global.players)
	szeregi.text = str(global.szeregi)
	kolumny.text = str(global.kolumny)

func _on_play_pressed():
	global.players = int(gracze.text)
	global.szeregi = int(szeregi.text)
	global.kolumny = int(kolumny.text)
	get_tree().change_scene_to_file("res://scenes//WybierzAkcje.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes//options.tscn")
	
func _on_exit_pressed():
	get_tree().quit()


func _on_rooms_pressed():
	get_tree().change_scene_to_file("res://scenes//rooms.tscn")
