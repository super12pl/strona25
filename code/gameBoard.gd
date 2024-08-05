extends TileMap
##Stałe
var tilesetIndex = global.tilesetIndex
var rng = RandomNumberGenerator.new()
##Zależne od użytkownika
var pokoje = global.pulaPokoi

## Called when the node enters the scene tree for the first time.🤓🤓🤓

func _ready():
	var kolumny = global.kolumny
	var szeregi = global.szeregi
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
			else:
				if distanceFromCenter>innerPoolDistance:
					tile = outerPool.pop_front()
				else:
					tile = innerPool.pop_front()
				for i in range(0,tilesetIndex.size()):
					if tilesetIndex[i].has(tile):
						set_cell(0,Vector2i(kolumna,szereg),1,Vector2i(tilesetIndex[i].find(tile,0),i))
						break
func _input(event):
	if event is InputEventMouseButton:
		##będzie ogarniał faktyczne granie
		print(local_to_map(event.position))
