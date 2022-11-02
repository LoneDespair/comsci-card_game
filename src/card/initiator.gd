extends Control

var key := "CAKE"

signal setup_finished

onready var letter_logic := $"../letter_logic"
onready var selection_logic := $"../selection_logic"
onready var answer_logic := $"../answer_logic"



func _ready() -> void:
	letter_logic.setup(key)
	selection_logic.setup()
	answer_logic.setup(key)


