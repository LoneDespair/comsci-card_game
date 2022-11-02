extends Control

var key := "CAKE"

signal setup_finished

onready var letter_logic := $"../letter_logic"
onready var answer_logic := $"../answer_logic"



func _ready() -> void:
	letter_logic.setup(key)
	answer_logic.setup(key)


