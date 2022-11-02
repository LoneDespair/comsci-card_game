extends Node

const CARD_PCK := preload("../card/card.tscn")

onready var deck := $"%deck"
onready var scroll := $"%scroll"

var key_list := ["COCO", "DONUT", "JELLY", "CAKE"]


func _ready() -> void:
	for idx in key_list.size():
		var key = key_list[idx]
		var card_scn := CARD_PCK.instance()
		deck.add_child(card_scn)
		deck.move_child(card_scn, idx + 1)
		
		card_scn.get_node("%question").text = key
		
		var checker := card_scn.get_node("checker")
		checker.connect("correct", self, "correct")
		checker.setup(key)
		
		
		


func correct() -> void:
	scroll.scroll_horizontal += 300


