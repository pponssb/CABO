extends Node2D
var full_deck = ["1C", "2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "10C", "JC", "QC", "KC",
"1P", "2P", "3P", "4P", "5P", "6P", "7P", "8P", "9P", "10P", "JP", "QP", "KP",
"1T", "2T", "3T", "4T", "5T", "6T", "7T", "8T", "9T", "10T", "JT", "QT", "KT",
"1D", "2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "10D", "JD", "QD", "KD"]
var current_deck = []

@onready var p1 = $"../p1"
@onready var p2 = $"../p2"

func deal_cards():
	current_deck=full_deck.duplicate()
	var p1_cards = [carta_nova(), carta_nova(), carta_nova(), carta_nova()]
	var p2_cards = [carta_nova(), carta_nova(), carta_nova(), carta_nova()]
	#posa les 4 cartes a cada jugador
func carta_nova():
	var card = current_deck[randi()%current_deck.size()] # divideix un nombre random entre el nombre de cartes que hi ha a current_deck i agafa el residu
	current_deck.erase(card)

func _ready():
	
