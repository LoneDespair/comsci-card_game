extends Node

const PLAY := preload("res://src/play/play.tscn")

onready var play_button := $"%play"
onready var ui := $"../ui"


func _ready() -> void:
	play_button.connect("pressed", self, "play")


func play() -> void:
	ui.hide()
	get_parent().add_child(PLAY.instance())

