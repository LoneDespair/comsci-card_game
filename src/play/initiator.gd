extends Node

const CARD_PCK := preload("../card/card.tscn")

onready var deck := $"%deck"
onready var turn := $"../turn"

var key_list := ["COCO", "COCO", "DONUT", "JELLY", "CAKE"]


func _ready() -> void:
	for idx in key_list.size():
		var key = key_list[idx]
		var card_scn := CARD_PCK.instance()
		deck.add_child(card_scn)
		
#		card_scn.get_node("%question").text = key
		
		var checker := card_scn.get_node("checker")
		checker.setup(key)
	
	turn.next()





