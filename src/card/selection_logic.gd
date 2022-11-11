extends Node

const MAX_COLUMNS := 9
const MIN_COLUMNS := 2

onready var selection_container := $"%selection" as GridContainer
onready var answer_container := $"%answer"
onready var answer_logic := $"../answer_logic"


func _ready() -> void:
	answer_logic.connect("letter_pressed", self, "add")


func add(letter_scn : Button) -> void:
	letter_scn.connect("pressed", self, "select", [letter_scn])
	selection_container.add_child(letter_scn)
	balance()


func select(letter_scn : Button) -> void:
	var holder = answer_logic.get_holder()
	
	if is_instance_valid(holder):
		selection_container.remove_child(letter_scn)
		letter_scn.disconnect("pressed", self, "select")
		
		answer_logic.add(letter_scn, holder)
		balance()
	
	else:
		prints("Answer fulll")


func balance() -> void:
	var count : float = selection_container.get_child_count()
	
	if count > MIN_COLUMNS:
		selection_container.columns = (count + 1) / 2
		prints(selection_container.columns)
	

