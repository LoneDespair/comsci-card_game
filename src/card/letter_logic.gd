extends Node

const LETTER_PCK := preload("./letter.tscn")

# Extra random letters
const DUMMY_COUNT := 3
const A_ASCII := 65
const Z_ASCII := 90

onready var selection_container := $"%selection"


func setup(key : String) -> void:
	var selection := []
	
	for letter in key:
		selection.append(letter)
	
	for idx in DUMMY_COUNT:
		var num := randi() % (Z_ASCII - A_ASCII) + A_ASCII
		selection.append(char(num))
	
	randomize()
	selection.shuffle()
	
	for letter in selection:
		var letter_scn := LETTER_PCK.instance() as Button
		
		selection_container.add_child(letter_scn)
		letter_scn.text = letter
