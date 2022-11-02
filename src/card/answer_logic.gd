extends Node

const HOLDER := preload("./holder.tscn")

onready var answer_container := $"%answer"


func _ready() -> void:
	var holder := HOLDER.instance()
	
	pass

