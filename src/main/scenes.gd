extends Node

const PLAY_PCK := preload("res://src/play/play.tscn")

onready var menu_scn := $"../menu"
onready var play_button := $"%play"

onready var settings_scn := $"../settings"
onready var settings_exit := $"../settings/%exit"
onready var settings_button := $"%settings_button"


func _ready() -> void:
	play_button.connect("pressed", self, "play")
	settings_exit.connect("pressed", self, "menu")
	settings_button.connect("pressed", self, "settings")


func play() -> void:
	menu_scn.hide()
	var play_scn := PLAY_PCK.instance()
	get_parent().add_child(play_scn)
	play_scn.connect("tree_exiting", self, "menu")


func settings() -> void:
	menu_scn.hide()
	settings_scn.show()


func menu() -> void:
	menu_scn.show()


