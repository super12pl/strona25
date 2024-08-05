extends Node
var players := 4
var szeregi := 5
var kolumny := 5
var zieloneIndex := ["sala wideo","ruchomy pokój","pokój z tunelem","komora robotów","komora regeneracji","pusty pokój","sterownia"]
var zulteIndex := ["pokój z wirem","cela","ciemny pokój","komora chłodu","komora obrotowa","komora zakłócania","pokój ZRB","pokój luster"]
var czerwoneIndex := ["wanna z kwasem","zalana komora","pokój pułapka","pokój iluzji","komora śmierci", "pokój paranoi","pokój zegarowy","komora pił"] 
var zielone = ["sala wideo","ruchomy pokój","sterownia","pokój z tunelem","pokój z tunelem","pokój z tunelem","komora robotów","komora robotów","komora regeneracji","komora regeneracji"]
var żółte = ["pokój z wirem","pokój z wirem","cela","cela","ciemny pokój","ciemny pokój","komora chłodu","komora chłodu","komora obrotowa","komora obrotowa","komora zakłócania","pokój ZRB","pokój ZRB","pokój luster"]
var czerwone = ["wanna z kwasem","wanna z kwasem","zalana komora","zalana komora","pokój pułapka","pokój pułapka","pokój iluzji","komora śmierci","komora śmierci", "pokój paranoi","pokój zegarowy","komora pił","komora pił"]
@onready var width := get_window().size.x
@onready var height := get_window().size.y

func _ready():
	get_window().size = Vector2i(width,height)
