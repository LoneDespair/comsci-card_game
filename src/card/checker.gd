extends Node

onready var answer_container := $"%answer"

var key : String

signal key_setuped
signal correct


func setup(new_key : String) -> void:
	key = new_key
	emit_signal("key_setuped", new_key)


func get_letter_list() -> Array:
	var list := []
	
	for holder in answer_container.get_children():
		if holder.get_child_count() != 1:
			continue
		
		list.append(holder.get_child(0))
	
	return list


func check() -> void:
	var answer := ""
	var letter_list := get_letter_list()
	
	if letter_list.size() != key.length():
		return
	
	for idx in letter_list.size():
		var letter_scn := letter_list[idx] as Button
		answer += letter_scn.text
	
	if answer == key:
		emit_signal("correct")
	
	else:
		for idx in letter_list.size():
			var letter_scn := letter_list[idx] as Button
			letter_scn.theme_type_variation = "WrongLetter"
		
		prints("%s does not match the key %s" % [answer, key])


func uncheck() -> void:
	var letter_list := get_letter_list()
	
	for idx in letter_list.size():
		var letter_scn := letter_list[idx] as Button
		letter_scn.theme_type_variation = "NeutralLetter"
	


