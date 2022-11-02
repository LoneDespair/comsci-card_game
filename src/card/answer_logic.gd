extends Node

const HOLDER := preload("./holder.tscn")

onready var answer_container := $"%answer"
onready var initiator := $"../initiator"


func _ready() -> void:
	initiator.connect("setup_finished", self, "setup")


func setup(key : String) -> void:
	for idx in key.length():
		var holder := HOLDER.instance()
		answer_container.add_child(holder)

