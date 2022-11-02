extends Node

onready var card1 := $"%card1"


func _ready() -> void:
	yield(get_tree(), "idle_frame")
	card1.rect_scale *= 1.1

