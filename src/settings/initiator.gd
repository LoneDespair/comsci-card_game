extends Node

onready var exit_button := $"%exit"


func _ready() -> void:
	exit_button.connect("pressed", get_parent(), "hide")

