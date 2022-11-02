extends Node

onready var selection_container := $"%selection"


func setup() -> void:
	for letter_scn in selection_container.get_children():
		letter_scn.connect("pressed", self, "select")
	


func select(letter_scn) -> void:
	pass




