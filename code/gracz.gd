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

func look(coords: Vector2i,beingTeleported: bool = false):
	var tilemap = get_node("TileMap")
	if ([tilemap.get_neighbor_cell(currentPosition,0),tilemap.get_neighbor_cell(currentPosition,4),tilemap.get_neighbor_cell(currentPosition,8),tilemap.get_neighbor_cell(currentPosition,12)].has(coords) or beingTeleported == true) and global.zakryte[coords.x][coords.y]:	
		return true
	else:
		return false
		
#ruchanie pokoi
func move_room(ArrowMenu, Board, coords: Vector2i,beingTeleported: bool = false):
	
	var Up = Button.new()
	var Down = Button.new()
	var Left = Button.new()
	var Right = Button.new()

	Up.pressed.connect(self._move_room_handle.bind("up",Up,Down,Left,Right,ArrowMenu,Board, coords))
	Down.pressed.connect(self._move_room_handle.bind("down",Up,Down,Left,Right,ArrowMenu,Board, coords))
	Left.pressed.connect(self._move_room_handle.bind("left",Up,Down,Left,Right,ArrowMenu,Board, coords))
	Right.pressed.connect(self._move_room_handle.bind("right",Up,Down,Left,Right,ArrowMenu,Board, coords))
	
	Up.text = "🔼"
	Down.text = "🔽"
	Left.text = "◀️"
	Right.text = "▶️"
	
	if(global.buttonsCreated == false):
		if(self.currentPosition[0] != 2):
			ArrowMenu.add_child(Up)
			ArrowMenu.add_child(Down)
		if(self.currentPosition[1] != 2):
			ArrowMenu.add_child(Left)
			ArrowMenu.add_child(Right)
		global.buttonsCreated = true
	
func _move_room_handle(direction,Up,Down,Left,Right,ArrowMenu, Board, coords):
	var misc
	match direction:
		
		"up":
			misc = global.plansza[self.currentPosition[0]][0]
			for i in range(0,5):
				if i != 4:
					global.plansza[self.currentPosition[0]][i] = global.plansza[self.currentPosition[0]][i+1]
				else:
					global.plansza[self.currentPosition[0]][4] = misc
					
				for j in range(0,global.tilesetIndex.size()):
					if global.tilesetIndex[j].has(global.plansza[self.currentPosition[0]][i]):
						Board.set_cell(0,Vector2i(self.currentPosition[0],i),1,Vector2i(global.tilesetIndex[j].find(global.plansza[self.currentPosition[0]][i],0),j))
			
			if self.currentPosition[1] != 0:
				self.move(Vector2i(self.currentPosition[0],self.currentPosition[1]-1),true,true)
			else:
				self.move(Vector2i(self.currentPosition[0],4),true,true)
				
		"down":
			misc = global.plansza[self.currentPosition[0]][4]
			for i in range(0,5):
				if i != 4:
					global.plansza[self.currentPosition[0]][4-i] = global.plansza[self.currentPosition[0]][3-i]
				else:
					global.plansza[self.currentPosition[0]][0] = misc
					
				for j in range(0,global.tilesetIndex.size()):
					if global.tilesetIndex[j].has(global.plansza[self.currentPosition[0]][4-i]):
						Board.set_cell(0,Vector2i(self.currentPosition[0],4-i),1,Vector2i(global.tilesetIndex[j].find(global.plansza[self.currentPosition[0]][4-i],0),j))
			
			if self.currentPosition[1] != 4:
				self.move(Vector2i(self.currentPosition[0],self.currentPosition[1]+1),true,true)
			else:
				self.move(Vector2i(self.currentPosition[0],0),true,true)
				
			
		"left":
			misc = global.plansza[0][self.currentPosition[1]]
			for i in range(0,5):
				if i != 4:
					global.plansza[i][self.currentPosition[1]] = global.plansza[i+1][self.currentPosition[1]]
				else:
					global.plansza[4][self.currentPosition[1]] = misc
					
				for j in range(0,global.tilesetIndex.size()):
					if global.tilesetIndex[j].has(global.plansza[i][self.currentPosition[1]]):
						Board.set_cell(0,Vector2i(i,self.currentPosition[1]),1,Vector2i(global.tilesetIndex[j].find(global.plansza[i][self.currentPosition[1]],0),j))
			
			if self.currentPosition[0] != 0:
				self.move(Vector2i(self.currentPosition[0]-1,self.currentPosition[1]),true,true)
			else:
				self.move(Vector2i(4,self.currentPosition[1]),true,true)
				
		"right":
			misc = global.plansza[4][self.currentPosition[1]]
			for i in range(0,5):
				if i != 4:
					global.plansza[4-i][self.currentPosition[1]] = global.plansza[3-i][self.currentPosition[1]]
				else:
					global.plansza[0][self.currentPosition[1]] = misc
					
				for j in range(0,global.tilesetIndex.size()):
					if global.tilesetIndex[j].has(global.plansza[4-i][self.currentPosition[1]]):
						Board.set_cell(0,Vector2i(4-i,self.currentPosition[1]),1,Vector2i(global.tilesetIndex[j].find(global.plansza[4-i][self.currentPosition[1]],0),j))
			
			if self.currentPosition[0] != 4:
				self.move(Vector2i(self.currentPosition[0]+1,self.currentPosition[1]),true,true)
			else:
				self.move(Vector2i(0,self.currentPosition[1]),true,true)
				
	ArrowMenu.remove_child(Up)
	ArrowMenu.remove_child(Down)
	ArrowMenu.remove_child(Left)
	ArrowMenu.remove_child(Right)
	
	global.buttonsCreated = false
	
	return true
			
#Rusza gracza do podanej pozycji jeśli jest sąsiadująca
func move(coords: Vector2i,beingTeleported: bool = false, beingRoomMoved: bool = false):
	var tilemap = get_node("TileMap")
	if [tilemap.get_neighbor_cell(currentPosition,0),tilemap.get_neighbor_cell(currentPosition,4),tilemap.get_neighbor_cell(currentPosition,8),tilemap.get_neighbor_cell(currentPosition,12)].has(coords) or beingTeleported == true:
		tilemap.set_cell(0,coords,id,Vector2i(0,0))
		tilemap.erase_cell(0,currentPosition)
		currentPosition = coords
		var room = global.plansza[currentPosition[0]][currentPosition[1]]
		if(beingRoomMoved == false):
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
					self.move(Vector2i(2,2),true)
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
