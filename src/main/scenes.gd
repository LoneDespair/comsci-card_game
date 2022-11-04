extends Node

const PLAY := preload("res://src/play/play.tscn")

onready var menu := $"../menu"
onready var play_button := $"%play"


func _ready() -> void:
	play_button.connect("pressed", self, "play")


func play() -> void:
	menu.hide()
	get_parent().add_child(PLAY.instance())

