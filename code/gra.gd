extends Node2D

@onready var typ = $"../Control2/VBoxContainer/typ"
@onready var plansza = $Control/TileMap
var szeregi = global.szeregi
var kolumny = global.kolumny
var tilesetIndex = global.tilesetIndex
var gracz = preload("res://scenes/gracz.tscn").instantiate()
var zakolejkowaneAkcje = [] #kolejka akcji
var lookedAt = null

func _ready():
	add_child(gracz)
	gracz.spawn(0)
	

func _input(event):
	if event is InputEventMouseButton:
		if event.is_action_pressed("left_click"):
			##ignoruje kliknięcia poza planszą
			var coords = plansza.local_to_map(event.position)
			if coords.x < szeregi and coords.y < kolumny:
				var tile = global.plansza[coords.x][coords.y]
				if lookedAt:
					plansza.set_cell(0,lookedAt,1,Vector2i(3,5))
					lookedAt = null
				elif zakolejkowaneAkcje.size()>0:
					match zakolejkowaneAkcje.pop_front():
						0:
							if gracz.look(coords):
								typ.text = tile
								for i in range(0,tilesetIndex.size()):
									if tilesetIndex[i].has(tile):
										plansza.set_cell(0,coords,1,Vector2i(tilesetIndex[i].find(tile,0),i))
										lookedAt = coords
										break
							else:
								zakolejkowaneAkcje.insert(0,0)
						1:
							if gracz.move(coords):
								typ.text = tile
								for i in range(0,tilesetIndex.size()):
									if tilesetIndex[i].has(tile):
										plansza.set_cell(0,coords,1,Vector2i(tilesetIndex[i].find(tile,0),i))
										global.zakryte[coords.x][coords.y] = false
										break
							else:
								zakolejkowaneAkcje.insert(0,1)
						2:
							print("Przesunięcie")
						3:
							print("Pchanie na ",coords)
						4:
							print("Specjał")
							
							
							
		if event.is_action_pressed("right_click"):
			##ignoruje kliknięcia poza planszą
			if plansza.local_to_map(event.position).x < szeregi and plansza.local_to_map(event.position).y < kolumny:
				for i in range(0,tilesetIndex.size()):
					print(tilesetIndex[i].find(global.plansza[plansza.local_to_map(event.position).x][plansza.local_to_map(event.position).y]))


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes//Menu.tscn")


func _on_wybierz_akcje_player_actions(actions):
	zakolejkowaneAkcje = actions
		
