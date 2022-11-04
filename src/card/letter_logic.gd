extends Node

const LETTER_PCK := preload("./letter.tscn")

# Extra random letters
const DUMMY_COUNT := 3
const A_ASCII := 65
const Z_ASCII := 90

onready var selection_logic := $"../selection_logic"
onready var checker := $"../checker"
onready var letter_audio := $"../letter_audio"


func _ready() -> void:
	checker.connect("key_setuped", self, "setup")


func setup(key : String) -> void:
	var selection := []
	
	for letter in key:
		selection.append(letter)
	
	for idx in DUMMY_COUNT:
		var num := randi() % (Z_ASCII - A_ASCII) + A_ASCII
		selection.append(char(num))
	
	randomize()
	selection.shuffle()
	
	for letter in selection:
		var letter_scn := LETTER_PCK.instance() as Button
		letter_scn.text = letter
		letter_scn.connect("pressed", letter_audio, "play")
		selection_logic.add(letter_scn)
