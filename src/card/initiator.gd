extends Control

onready var ui := $"../ui"
onready var content := $"%content"


func set_front(is_front : bool) -> void:
	
	content.visible = is_front
	
	if is_front:
		ui.theme_type_variation = "FrontCard" 
		ui.rect_scale = Vector2.ONE
	
	else:
		ui.theme_type_variation = "BackCard"
#		ui.rect_scale = Vector2(0.855, 0.855)
	
	
