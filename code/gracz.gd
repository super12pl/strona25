extends Node2D
var kolumny = global.kolumny
var szeregi = global.szeregi
var currentPosition = Vector2i(int(ceil(kolumny/2)),int(ceil(szeregi/2)))
var id = 0

#Pojawia gracza na środku planszy
func spawn(id: int):
	get_node("TileMap").set_cell(0,currentPosition,id,Vector2i(0,0))
	id = id
	
#Rusza gracza do podanej pozycji jeśli jest sąsiadująca
func move(coords: Vector2i):
	var tilemap = get_node("TileMap")
	if [tilemap.get_neighbor_cell(currentPosition,0),tilemap.get_neighbor_cell(currentPosition,4),tilemap.get_neighbor_cell(currentPosition,8),tilemap.get_neighbor_cell(currentPosition,12)].has(coords):
		tilemap.set_cell(0,coords,id,Vector2i(0,0))
		tilemap.erase_cell(0,currentPosition)
		currentPosition = coords
		return true
	else:
		return false

func look(coords: Vector2i):
	var tilemap = get_node("TileMap")
	if [tilemap.get_neighbor_cell(currentPosition,0),tilemap.get_neighbor_cell(currentPosition,4),tilemap.get_neighbor_cell(currentPosition,8),tilemap.get_neighbor_cell(currentPosition,12)].has(coords) and global.zakryte[coords.x][coords.y]:	
		return true
	else:
		return false

