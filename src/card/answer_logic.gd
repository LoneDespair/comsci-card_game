extends Node

const HOLDER := preload("./holder.tscn")

onready var answer_container := $"%answer"
onready var initiator := $"../initiator"
onready var checker := $"../checker"

signal letter_pressed(letter_scn)


func _ready() -> void:
	checker.connect("key_setuped", self, "setup")


func setup(new_key : String) -> void:
	for idx in new_key.length():
		var holder := HOLDER.instance()
		answer_container.add_child(holder)


func get_holder() -> Control:
	for holder in answer_container.get_children():
		if holder.get_child_count() == 0:
			return holder
	
	return null


func add(letter_scn : Button, holder : Control) -> void:
	holder.add_child(letter_scn)
	letter_scn.connect("pressed", self, "press", [letter_scn])
	checker.check()


func press(letter_scn : Button) -> void:
	checker.uncheck("NeutralLetter", false)
	letter_scn.get_parent().remove_child(letter_scn)
	
	letter_scn.disconnect("pressed", self, "press")
	emit_signal("letter_pressed", letter_scn)

