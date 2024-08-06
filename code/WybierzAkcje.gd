extends Node

signal player_actions(actions)

@onready var Hbox = $Bar
@onready var Action1choice = $Bar/Action1/Action1choice
@onready var Action2choice = $Bar/Action2/Action2choice

var Action3 = VBoxContainer.new()
var Action3label = Label.new()
var Action3choice = OptionButton.new()

var adrenalin = true
var aBtn = Button.new()
var Confirm = Button.new()

func _ready():
	if adrenalin:
		aBtn.text = "Użyj\nadrenalinę"
		aBtn.pressed.connect(self._useAdrenalin.bind())
		Hbox.add_child(aBtn)
		
	Hbox.add_child(Confirm)
	Confirm.text = "Zatwierdź"
	Confirm.pressed.connect(self._confirm.bind())
	

func _useAdrenalin():
	adrenalin = false
	
	Action3choice.item_selected.connect(self._on_action_3_choice_item_selected.bind())
	
	Action3choice.add_item("podpatrz",0)
	Action3choice.add_item("ruch",1)
	Action3choice.add_item("przesunięcie",2)
	Action3choice.add_item("pchnięcie",3)
	Action3choice.add_item("[specjalna]",4)
	Action3choice.select(-1)
	
	Action3label.text = "Akcja 3"
	
	Action3.add_child(Action3label)
	Action3.add_child(Action3choice)
	
	Hbox.add_child(Action3)
	Hbox.remove_child(aBtn)
	Confirm.move_to_front()

func _on_action_1_choice_item_selected(index):
	if index == Action2choice.get_selected_id() || index == Action3choice.get_selected_id():
		Action1choice.select(-1)
		
func _on_action_2_choice_item_selected(index):
	if index == Action1choice.get_selected_id() || index == Action3choice.get_selected_id():
		Action2choice.select(-1)

func _on_action_3_choice_item_selected(index):
	if index == Action1choice.get_selected_id() || index == Action2choice.get_selected_id():
		Action3choice.select(-1)

func _confirm():
	#nwm co ma sie dziać po zatwierdzeniu wiec zostawiam
	if (Action3label.text != "Akcja 3" && Action1choice.get_selected_id() != -1 && Action2choice.get_selected_id() != -1) || (Action3label.text == "Akcja 3" && Action1choice.get_selected_id() != -1 && Action2choice.get_selected_id() != -1 && Action3choice.get_selected_id() != -1):
		var wybraneRuchy
		if Action3label.text != "Akcja 3":
			wybraneRuchy = [Action1choice.get_selected_id(), Action2choice.get_selected_id()]
		else:
			wybraneRuchy = [Action1choice.get_selected_id(), Action2choice.get_selected_id(), Action3choice.get_selected_id()]
		global.wybraneRuchy = wybraneRuchy
		player_actions.emit(wybraneRuchy)
