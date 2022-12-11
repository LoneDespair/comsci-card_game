extends Node

const CARD_PCK := preload("../card/card.tscn")

var card_scn : Control
var wave_count := -1
var score := 0

var key_table := {
	"LOGIC" : "The basis of all mathematical reasoning, and of all automated reasoning",
	"PROOF" : "Valid arguments that establish the truth of mathematical statements",
	"OAK" : "Java was created by James Gosling, it was initially called ___, in honor of a tree",
	"ITERATION" : "A continue statement makes the execution jump to the next _________ of the loop",
	"CLOUD" : "A model for enabling convenient, on-demand network access to a shared pool of configurable computing resources",
	"CLASS" : "A template in java used to create objects and to define object data types and methods",
	"CONSTANT" : "A value that should not be altered by the program during normal execution",
	"INTEGER" : "A number without a fractional component, and don't support decimal points",
	"STRING" : "A datatype that contains an array of characters",
	"BITWISE" : "a level of operation that involves working with individual bits",
	"ARRAY" : "Collection of elements stored contigously in memory",
	"BYTECODE" : "The resulting compiled object code of a Java program is called?",
}

var key_list := key_table.keys()

onready var deck := $"%deck"
onready var circular_initiator := $"%circular_timer/initiator"
onready var fire := $"%fire"
onready var wave_label := $"%wave"
onready var gameover_scn := $"%gameover"
onready var score_label := $"%score"
onready var finish_audio := $"%finish_audio"


func _ready() -> void:
	randomize()
	key_list.shuffle()
	
	next()


func next() -> void:
	if is_instance_valid(card_scn):
		prints("Animate an exit sequence")
	
	wave_count += 1
	wave_label.text = "%d/10" % wave_count
	
	if wave_count >= 10:
		gameover_scn.show()
		score_label.text = "%d/10" % score
		fire.emitting = true
		finish_audio.play()
		
	
	else:
		card_scn = CARD_PCK.instance()
		deck.add_child(card_scn)
		
		var key = key_list.pop_back()
		card_scn.get_node("%question").text = key_table[key]
		card_scn.get_node("checker").setup(key)
		
		circular_initiator.start()
		var card_initiator := card_scn.get_node("initiator")
		
		circular_initiator.connect("timeout", card_initiator, "timeout")
		card_scn.get_node("checker").connect("correct", self, "correct")
		card_scn.get_node("%next").connect("pressed", self, "next")


func correct() -> void:
	score += 1
	circular_initiator.stop()
	fire.emitting = true

