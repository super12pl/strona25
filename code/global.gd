extends Node
var players := 4
var szeregi := 5
var kolumny := 5
var zieloneIndex := ["sala wideo","ruchomy pokój","pokój z tunelem","komora robotów","komora regeneracji","pusty pokój","sterownia"]
var zulteIndex := ["pokój z wirem","cela","ciemny pokój","komora chłodu","komora obrotowa","komora zakłócania","pokój ZRB","pokój luster"]
var czerwoneIndex := ["wanna z kwasem","zalana komora","pokój pułapka","pokój iluzji","komora śmierci", "pokój paranoi","pokój zegarowy","komora pił"] 

var tilesetIndex = [["pusty pokój","sala wideo","ruchomy pokój","sterownia","pokój z tunelem"],["komora regeneracji","komora robotów","pokój z wirem","cela","ciemny pokój"],["komora chłodu","komora obrotowa","fałszywe wyjście","pokój ZRB","pokój luster"],["wanna z kwasem","zalana komora","pokój pułapka","pokój iluzji","komora śmierci"],["pokój zegarowy","pokój paranoi","komora pił","komora zakłócania"],["pokój centralny","pokój szyfrowania","pokój 25"]]

var zielone = ["sala wideo","ruchomy pokój","pokój z tunelem","pokój z tunelem","pokój z tunelem","komora robotów","komora robotów","komora regeneracji","komora regeneracji","sterownia"]
var żółte = ["pokój z wirem","pokój z wirem","cela","cela","ciemny pokój","ciemny pokój","komora chłodu","komora chłodu","komora obrotowa","komora obrotowa","komora zakłócania","pokój ZRB","pokój ZRB","pokój luster"]
var czerwone = ["wanna z kwasem","wanna z kwasem","zalana komora","zalana komora","pokój pułapka","pokój pułapka","pokój iluzji","komora śmierci","komora śmierci", "pokój paranoi","pokój zegarowy","komora pił","komora pił"]
var pulaPokoi = ["sala wideo","ruchomy pokój","pokój z tunelem","pokój z tunelem","pokój z tunelem","komora robotów","komora robotów","komora regeneracji","komora regeneracji","sterownia","pokój z wirem","pokój z wirem","cela","cela","ciemny pokój","ciemny pokój","komora chłodu","komora chłodu","komora obrotowa","komora obrotowa","komora zakłócania","pokój ZRB","pokój ZRB","pokój luster","wanna z kwasem","wanna z kwasem","zalana komora","zalana komora","pokój pułapka","pokój pułapka","pokój iluzji","komora śmierci","komora śmierci", "pokój paranoi","pokój zegarowy","komora pił","komora pił"]
@onready var width := get_window().size.x
@onready var height := get_window().size.y

var plansza = []
var zakryte = []

#nie dotykać
var reloaded = false

var wybraneRuchy = []

func _ready():
	get_window().size = Vector2i(width,height)
