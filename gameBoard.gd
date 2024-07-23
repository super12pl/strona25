extends GridContainer
var zielonepokoje = ["sala wideo","ruchomy pokój","sterownia","pokój z tunelem","pokój z tunelem","pokój z tunelem","komora robotów","komora robotów","komora regeneracji","komora regeneracji"]
var żółtepokoje = ["pokój z wirem","pokój z wirem","cela","cela","ciemny pokój","ciemny pokój","komora chłodu","komora chłodu","komora obrotowa","komora obrotowa","komora zakłócania","pokój ZRB","pokój ZRB","pokój luster"]
var czerwonepokoje = ["wanna z kwasem","wanna z kwasem","zalana komora","zalana komora","pokój pułapka","pokój pułapka","pokój iluzji","komora śmierci","komora śmierci", "pokój paranoi","pokój zegarowy","komora pił","komora pił"]
## Called when the node enters the scene tree for the first time.
func _ready():
	var iloscPokoi = 25
	var pokoje = zielonepokoje + żółtepokoje + czerwonepokoje
	randomize()
	pokoje.shuffle()
	for n in iloscPokoi:
		var tile = Sprite2D.new()
		tile.texture = load("res://jajo.jpg")
		var label = Label.new()
		label.text = pokoje[n]
		label.add_theme_font_size_override("font_size",10)
		tile.add_child(label)
		add_child(tile)
		
