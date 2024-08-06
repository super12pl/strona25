extends Node2D
var kolumny = global.kolumny
var szeregi = global.szeregi

# Called when the node enters the scene tree for the first time.
func spawn(id: int):
	get_node("TileMap").set_cell(0,Vector2(int(ceil(kolumny/2)),int(ceil(szeregi/2))),id,Vector2i(0,0))
