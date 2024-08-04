extends TileMap
##Stałe
var zielonepokojeindex = ["sala wideo","ruchomy pokój","pokój z tunelem","komora robotów","komora regeneracji","pusty pokój","sterownia"]
var żółtepokojeindex = ["pokój z wirem","cela","ciemny pokój","komora chłodu","komora obrotowa","komora zakłócania","pokój ZRB","pokój luster"]
var czerwonepokojeindex = ["wanna z kwasem","zalana komora","pokój pułapka","pokój iluzji","komora śmierci", "pokój paranoi","pokój zegarowy","komora pił"]
var rng = RandomNumberGenerator.new()
##Zależne od użytkownika
var zielonepokoje = ["sala wideo","ruchomy pokój","sterownia","pokój z tunelem","pokój z tunelem","pokój z tunelem","komora robotów","komora robotów","komora regeneracji","komora regeneracji"]
var żółtepokoje = ["pokój z wirem","pokój z wirem","cela","cela","ciemny pokój","ciemny pokój","komora chłodu","komora chłodu","komora obrotowa","komora obrotowa","komora zakłócania","pokój ZRB","pokój ZRB","pokój luster"]
var czerwonepokoje = ["wanna z kwasem","wanna z kwasem","zalana komora","zalana komora","pokój pułapka","pokój pułapka","pokój iluzji","komora śmierci","komora śmierci", "pokój paranoi","pokój zegarowy","komora pił","komora pił"]

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
