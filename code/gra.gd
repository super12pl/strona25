extends Node2D

@onready var typ = $Control2/VBoxContainer/typ
@onready var plansza = $Control/TileMap
@onready var info = $Control/Control/TileMap
var szeregi = global.szeregi
var kolumny = global.kolumny
var tilesetIndex = global.tilesetIndex

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes//Menu.tscn")

func _input(event):
	if event is InputEventMouseButton:
		if event.is_action_pressed("left_click"):
			##ignoruje kliknięcia poza planszą
			if plansza.local_to_map(event.position).x < szeregi and plansza.local_to_map(event.position).y < kolumny:
				##będzie ogarniał faktyczne granie
				var tile = global.plansza[plansza.local_to_map(event.position).x][plansza.local_to_map(event.position).y]
				print(plansza.local_to_map(event.position),tile)
				typ.text = tile
				for i in range(0,tilesetIndex.size()):
					if tilesetIndex[i].has(tile):
						plansza.set_cell(0,plansza.local_to_map(event.position),1,Vector2i(tilesetIndex[i].find(tile,0),i))
						break
	
	if event.is_action_pressed("right_click"):
		##ignoruje kliknięcia poza planszą
		if plansza.local_to_map(event.position).x < szeregi and plansza.local_to_map(event.position).y < kolumny:
			for i in range(0,tilesetIndex.size()):
				print(tilesetIndex[i].find(global.plansza[plansza.local_to_map(event.position).x][plansza.local_to_map(event.position).y]))
