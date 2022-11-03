extends Node

const CARD_PCK := preload("../card/card.tscn")

onready var deck := $"%deck"
onready var scroll := $"%scroll"

var next_idx := 0
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
		
		card_scn.get_node("ui").theme_type_variation = "BackCard"
		card_scn.get_node("%content").hide()
	
	next()


func next() -> void:
	if next_idx < deck.get_child_count():
		var card_scn := deck.get_child(next_idx)
		card_scn.get_node("ui").theme_type_variation = "FrontCard"
		card_scn.get_node("%content").show()
		
		scroll.scroll_horizontal = (card_scn.rect_size.x + 10) * next_idx
		next_idx += 1
		prints("NExt")
	
	else:
		prints("Gameover")


func correct() -> void:
	next()


