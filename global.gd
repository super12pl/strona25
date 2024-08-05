extends Node
var players := 4
var szeregi := 5
var kolumny := 5
var zielone := ["sala wideo","ruchomy pokój","pokój z tunelem","komora robotów","komora regeneracji","pusty pokój","sterownia"]
var zulte := ["pokój z wirem","cela","ciemny pokój","komora chłodu","komora obrotowa","komora zakłócania","pokój ZRB","pokój luster"]
var czerwone := ["wanna z kwasem","zalana komora","pokój pułapka","pokój iluzji","komora śmierci", "pokój paranoi","pokój zegarowy","komora pił"] 
@onready var width := get_window().size.x
@onready var height := get_window().size.y

func _ready():
	get_window().size = Vector2i(width,height)
