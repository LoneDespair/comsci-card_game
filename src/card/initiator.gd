extends Control

var key := "CAKE"

onready var checker := $"../checker"

signal setup_finished


func _ready() -> void:
	checker.setup(key)

