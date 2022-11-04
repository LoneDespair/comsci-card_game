extends Node

const CARD_PCK := preload("../card/card.tscn")

onready var deck := $"%deck"
#onready var scroll := $"%scroll"

var current_idx := -1
var key_list := ["COCO", "DONUT", "JELLY", "CAKE"]


func _ready() -> void:
	for idx in key_list.size():
		var key = key_list[idx]
		var card_scn := CARD_PCK.instance()
		deck.add_child(card_scn)
		
		card_scn.get_node("%question").text = key
		
		var checker := card_scn.get_node("checker")
		checker.connect("correct", self, "correct")
		checker.setup(key)
		
		card_scn.get_node("initiator").set_front(false)
	
	next()


func next() -> void:
	var card_count := deck.get_child_count()
	
	if card_count <= 0:
		return
	
	if current_idx > -1:
		deck.get_child(current_idx).get_node("initiator").set_front(false)
	
	if current_idx < card_count:
		current_idx += 1
		var card_scn := deck.get_child(current_idx) as Control
		card_scn.get_node("initiator").set_front(true)
		
		deck.rect_position.x -= (card_scn.rect_size.x + 10)
#		scroll.scroll_horizontal = (card_scn.rect_size.x + 10) * current_idx
		
		prints("NExt")
	
	else:
		prints("Gameover")


func correct() -> void:
	next()


