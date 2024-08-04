extends Node
var players := 4
var szeregi := 5
var kolumny := 5
@onready var width := get_window().size.x
@onready var height := get_window().size.y

func _ready():
	get_window().size = Vector2i(width,height)
