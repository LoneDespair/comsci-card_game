extends Control

var key := "CAKE"

onready var checker := $"../checker"


func _ready() -> void:
	checker.setup(key)

