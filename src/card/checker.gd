extends Node

onready var answer_container := $"%answer"

var key : String

signal key_setuped


func setup(new_key : String) -> void:
	key = new_key
	emit_signal("key_setuped", new_key)


func check() -> void:
	var answer := ""
	
	for holder in answer_container.get_children():
		if holder.get_child_count() != 1:
			break
		
		var letter_scn := holder.get_child(0) as Button
		answer += letter_scn.text
	
	if answer == key:
		prints("Victory")
