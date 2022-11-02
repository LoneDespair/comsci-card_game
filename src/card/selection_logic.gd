extends Node

onready var selection_container := $"%selection"
onready var answer_container := $"%answer"
onready var answer_logic := $"../answer_logic"


func setup() -> void:
	for letter_scn in selection_container.get_children():
		letter_scn.connect("pressed", self, "select", [letter_scn])


func select(letter_scn : Button) -> void:
	if answer_logic.next_idx < answer_container.get_child_count():
		selection_container.remove_child(letter_scn)
		letter_scn.disconnect("pressed", self, "select")
		
		answer_logic.add(letter_scn)
	
	else:
		prints("Answer fulll")


