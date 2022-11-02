extends Node

onready var answer_container := $"%answer"
onready var selection_container := $"%selection"


func _ready() -> void:
	
	
	for letter in selection_container.get_children():
		letter.connect("pressed", self, "select", [letter])
	


func select(letter : Button) -> void:
	selection_container.remove_child(letter)
	answer_container.add_child(letter)


