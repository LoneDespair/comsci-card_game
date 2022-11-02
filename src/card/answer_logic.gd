extends Node

const HOLDER := preload("./holder.tscn")

var next_idx := 0

onready var answer_container := $"%answer"
onready var initiator := $"../initiator"


func _ready() -> void:
	initiator.connect("setup_finished", self, "setup")


func setup(key : String) -> void:
	for idx in key.length():
		var holder := HOLDER.instance()
		answer_container.add_child(holder)


func add(letter_scn : Button) -> void:
	var holder := answer_container.get_child(next_idx)
	holder.add_child(letter_scn)
	
	next_idx += 1
	
	

