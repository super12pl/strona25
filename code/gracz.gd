extends Node2D
var kolumny = global.kolumny
var szeregi = global.szeregi
var currentPosition = Vector2i(int(ceil(kolumny/2)),int(ceil(szeregi/2)))
var id = 0

#Pojawia gracza na środku planszy
func spawn(id: int):
	get_node("TileMap").set_cell(0,currentPosition,id,Vector2i(0,0))
	id = id
	
func death(id:int):
	get_node("TileMap").set_cell(0,currentPosition,id,Vector2i(1,0))
	id = id

func look(coords: Vector2i):
	var tilemap = get_node("TileMap")
	if [tilemap.get_neighbor_cell(currentPosition,0),tilemap.get_neighbor_cell(currentPosition,4),tilemap.get_neighbor_cell(currentPosition,8),tilemap.get_neighbor_cell(currentPosition,12)].has(coords) and global.zakryte[coords.x][coords.y]:	
		return true
	else:
		return false
		

#Rusza gracza do podanej pozycji jeśli jest sąsiadująca
func move(coords: Vector2i):
	var tilemap = get_node("TileMap")
	if [tilemap.get_neighbor_cell(currentPosition,0),tilemap.get_neighbor_cell(currentPosition,4),tilemap.get_neighbor_cell(currentPosition,8),tilemap.get_neighbor_cell(currentPosition,12)].has(coords):
		tilemap.set_cell(0,coords,id,Vector2i(0,0))
		tilemap.erase_cell(0,currentPosition)
		currentPosition = coords
		var room = global.plansza[currentPosition[0]][currentPosition[1]]
		match room:
			"pusty pokój":
				print(room)
			"sala wideo":
				print(room)
			"ruchomy pokój":
				print(room)
			"sterownia":
				print(room)
			"pokój z tunelem":
				print(room)
			"komora regeneracji":
				print(room)
			"komora robotów":
				print(room)
			"pokój z wirem":
				print(room)
			"cela":
				print(room)
			"ciemny pokój":
				print(room)
			"komora chłodu":
				print(room)
			"komora obrotowa":
				print(room)
			"pokój ZRB":
				print(room)
			"pokój luster":
				print(room)
			"wanna z kwasem":
				print(room)
			"zalana komora":
				print(room)
			"pokój pułapka":
				print(room)
			"pokój iluzji":
				print(room)
			"komora śmierci":
				self.death(self.id)
			"pokój zegarowy":
				print(room)
			"pokój paranoi":
				print(room)
			"komora pił":
				print(room)
			"komora zakłócania":
				print(room)
			"pokój centralny":
				print(room)
			"pokój szyfrowania":
				print(room)
			"pokój 25":
				print(room)
		return true
	else:
		return false
