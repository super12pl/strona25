extends TileMap
##Stałe
var zielonepokojeindex = global.zieloneIndex
var czerwonepokojeindex = global.czerwoneIndex
var żółtepokojeindex = global.zulteIndex
var rng = RandomNumberGenerator.new()
##Zależne od użytkownika
var zielonepokoje = global.zielone
var żółtepokoje = global.żółte
var czerwonepokoje = global.czerwone

## Called when the node enters the scene tree for the first time.🤓🤓🤓

func _ready():
	var kolumny = global.kolumny
	var szeregi = global.szeregi
	var pokoje = zielonepokoje + czerwonepokoje + żółtepokoje
	##dodawanie pustych pokoi gdy normalnych jest za mało
	if pokoje.size() < kolumny*szeregi:
		for i in kolumny*szeregi - pokoje.size():
			pokoje.append("pusty pokój")
	randomize()
	pokoje.shuffle()
	for kolumna in kolumny:
		for szereg in szeregi:
			var tile = ""
			if kolumna == int(ceil(kolumny/2)) and szereg == int(ceil(szeregi/2)):
				tile = "pokój centralny"
				set_cell(0,Vector2i(kolumna,szereg),0,Vector2i(0,3))
			else:
				tile = pokoje.pop_front()
				if zielonepokojeindex.has(tile):
					set_cell(0,Vector2i(kolumna,szereg),0,Vector2i(zielonepokojeindex.find(tile,0),0))
				elif żółtepokojeindex.has(tile):
					set_cell(0,Vector2i(kolumna,szereg),0,Vector2i(żółtepokojeindex.find(tile,0),1))
				elif czerwonepokojeindex.has(tile):
					set_cell(0,Vector2i(kolumna,szereg),0,Vector2i(czerwonepokojeindex.find(tile,0),2))
	##generacja pokoju 25 osobno
	while true:
		var kolumna = ceil(rng.randf_range(-1,kolumny-1))
		var szereg = ceil(rng.randf_range(-1,szeregi-1))
		if kolumna == 0 or kolumna == kolumny-1 or szereg == 0 or szereg == szeregi-1:
			set_cell(0,Vector2i(kolumna,szereg),0,Vector2i(1,3))
			break


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes//Menu.tscn")
