extends Node

var current_idx := -1

onready var deck := $"%deck"
onready var circular_initiator := $"%circular_timer/initiator"
onready var fire := $"%fire"


func next() -> void:
	var card_count := deck.get_child_count()
	
	if card_count <= 0:
		return
	
	circular_initiator.start()
	
	if current_idx > -1:
		deck.get_child(current_idx).get_node("initiator").set_front(false)
	
	
	if current_idx + 1 < card_count:
		current_idx += 1
		var card_scn := deck.get_child(current_idx) as Control
		var card_initiator := card_scn.get_node("initiator")
		
		circular_initiator.connect("timeout", card_initiator, "timeout")
		
		card_scn.get_node("%next").connect("pressed", self, "next")
		deck.rect_position.x -= card_scn.rect_size.x + 5
	
	else:
		prints("Gameover")


func correct() -> void:
	fire.emitting = true
	next()

