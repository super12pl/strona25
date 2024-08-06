extends TileMap
##Stałe
var tilesetIndex = global.tilesetIndex
var rng = RandomNumberGenerator.new()
var kolumny = global.kolumny
var szeregi = global.szeregi
##Zależne od użytkownika
var pokoje = global.pulaPokoi
@onready var typ = $"../../Control2/VBoxContainer/typ"

## Called when the node enters the scene tree for the first time.🤓🤓🤓

func _ready():
	global.plansza = []
	for i in kolumny:
		global.plansza.append([])
	##dodawanie pustych pokoi gdy normalnych jest za mało
	if pokoje.size() < (kolumny*szeregi)-2:
		for i in ((kolumny*szeregi)-2) - pokoje.size():
			pokoje.append("pusty pokój")
	randomize()
	pokoje.shuffle()
	##odejmowanie pokoi jeśli jest ich za dużo
	while pokoje.size() > (kolumny*szeregi)-2:
		pokoje.pop_back()
	var innerPool = []
	var outerPool = []
	var innerPoolDistance = floor(max(kolumny,szeregi)/2)
	var innerPoolAmount = 0
	for kolumna in kolumny:
		for szereg in szeregi:
			if Vector2(kolumna,szereg).distance_to(Vector2(int(ceil(kolumny/2)),int(ceil(szeregi/2)))) <= innerPoolDistance:
				innerPoolAmount+=1
	for i in range(0,pokoje.size()):
		if i < innerPoolAmount-1:
			innerPool.append(pokoje[i])
		else:
			outerPool.append(pokoje[i])
	outerPool.append("pokój 25")
	randomize()
	innerPool.shuffle()
	outerPool.shuffle()
	for kolumna in kolumny:
		for szereg in szeregi:
			var tile = ""
			var distanceFromCenter = Vector2(kolumna,szereg).distance_to(Vector2(int(ceil(kolumny/2)),int(ceil(szeregi/2))))
			if distanceFromCenter == 0:
				tile = "pokój centralny"
				set_cell(0,Vector2i(kolumna,szereg),1,Vector2i(0,5))
				global.plansza[kolumna].append(tile)
			else:
				if distanceFromCenter>innerPoolDistance:
					tile = outerPool.pop_front()
				else:
					tile = innerPool.pop_front()
				set_cell(0,Vector2i(kolumna,szereg),1,Vector2i(3,5))
				global.plansza[kolumna].append(tile)
func _input(event):
	if event is InputEventMouseButton:
		if event.is_action_pressed("left_click"):
			##ignoruje kliknięcia poza planszą
			if local_to_map(event.position).x < szeregi and local_to_map(event.position).y < kolumny:
				##będzie ogarniał faktyczne granie
				var tile = global.plansza[local_to_map(event.position).x][local_to_map(event.position).y]
				print(local_to_map(event.position),tile)
				typ.text = tile
				for i in range(0,tilesetIndex.size()):
					if tilesetIndex[i].has(tile):
						set_cell(0,local_to_map(event.position),1,Vector2i(tilesetIndex[i].find(tile,0),i))
						break
