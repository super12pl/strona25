extends Node

var index = global.zieloneIndex + global.zulteIndex + global.czerwoneIndex
var rooms

var reloaded = global.reloaded
var which = true

@onready var Vbox = $Table
@onready var Vbox2 = $Table2

func _ready():
	if !reloaded:
		rooms = global.pulaPokoi
	else:
		rooms = global.zielone + global.żółte + global.czerwone
		global.reloaded = false
		
	for room in index:
		if room != "pusty pokój":
		
			var Hbox = HBoxContainer.new()
			var icon = Label.new()
			var ammountLb = Label.new()
			var addBtn = Button.new()
			var removeBtn = Button.new()
			
			if(which):
				Vbox.add_child(Hbox)
				which = false
			else:
				Vbox2.add_child(Hbox)
				which = true
				
			Hbox.add_child(icon)
			Hbox.add_child(ammountLb)
			Hbox.add_child(addBtn)
			Hbox.add_child(removeBtn)
			
			icon.text = room
			ammountLb.text = str(rooms.count(room))
			addBtn.text = "+"
			removeBtn.text = "-"
			
			var send = ammountLb
			
			addBtn.pressed.connect(self._add.bind(room, send))
			removeBtn.pressed.connect(self._remove.bind(room, send))
			
func _add(name, send):
	rooms.append(name)
	send.text = str(int(send.text)+1)

func _remove(name, send):
	if name in rooms:
		rooms.remove_at(rooms.find(name))
		send.text = str(int(send.text)-1)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes//menu.tscn")

func _on_default_pressed():
	global.reloaded = true
	get_tree().reload_current_scene()
	
func _on_apply_pressed():
	global.pulaPokoi = rooms
