extends Node

onready var selection_container := $"%selection"
onready var answer_container := $"%answer"
onready var answer_logic := $"../answer_logic"


func _ready() -> void:
	answer_logic.connect("letter_pressed", self, "add")


func add(letter_scn : Button) -> void:
	letter_scn.connect("pressed", self, "select", [letter_scn])
	selection_container.add_child(letter_scn)


func select(letter_scn : Button) -> void:
	var holder = answer_logic.get_holder()
	
	if is_instance_valid(holder):
		selection_container.remove_child(letter_scn)
		letter_scn.disconnect("pressed", self, "select")
		
		answer_logic.add(letter_scn, holder)
	
	else:
		prints("Answer fulll")


