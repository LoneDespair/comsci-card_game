extends Control

onready var ui := $"../ui"
onready var content := $"%content"
onready var selection_background := $"%selection_background"
onready var next_button := $"%next"
onready var checker := $"../checker"
onready var correction_label := $"%correction"


func set_front(is_front : bool) -> void:
	content.visible = is_front
	
	if is_front:
		ui.theme_type_variation = "FrontCard" 
		ui.rect_scale = Vector2.ONE
	
	else:
		ui.theme_type_variation = "BackCard"
#		ui.rect_scale = Vector2(0.855, 0.855)


func timeout() -> void:
	selection_background.hide()
	next_button.show()
	
	checker.uncheck("WrongLetter", true)
	correction_label.text = "Correct Answer is:\n" + checker.key


