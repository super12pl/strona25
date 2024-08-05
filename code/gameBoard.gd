extends TileMap
##Stałe
var zielonepokojeindex = global.zieloneIndex
var żółtepokojeindex = global.zulteIndex
var czerwonepokojeindex = global.czerwoneIndex
var rng = RandomNumberGenerator.new()
##Zależne od użytkownika
var zielonepokoje = global.zielone
var żółtepokoje = global.żółte
var czerwonepokoje = global.czerwone

## Called when the node enters the scene tree for the first time.🤓🤓🤓

func _ready():
	var kolumny = global.kolumny
	var szeregi = global.szeregi
	var pokoje = zielonepokoje + żółtepokoje + czerwonepokoje 
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
				set_cell(0,Vector2i(kolumna,szereg),0,Vector2i(0,3))
			else:
				print(distanceFromCenter)
				if distanceFromCenter>innerPoolDistance:
					tile = outerPool.pop_front()
				else:
					tile = innerPool.pop_front()
				if zielonepokojeindex.has(tile):
					set_cell(0,Vector2i(kolumna,szereg),0,Vector2i(zielonepokojeindex.find(tile,0),0))
				elif żółtepokojeindex.has(tile):
					set_cell(0,Vector2i(kolumna,szereg),0,Vector2i(żółtepokojeindex.find(tile,0),1))
				elif czerwonepokojeindex.has(tile):
					set_cell(0,Vector2i(kolumna,szereg),0,Vector2i(czerwonepokojeindex.find(tile,0),2))
				else:
					set_cell(0,Vector2i(kolumna,szereg),0,Vector2i(1,3))

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes//Menu.tscn")
