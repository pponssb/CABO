extends Node
var num_jugadors_seleccionats = 4
var boto = Button.new()
var jugadors = ["ANNA","MARC","PAU","ZOE"]
var jugador_actual = 0
var carta_actual = []
var cartes_girades = []
var bloqueig_total: bool = false
var p1_cards = []
var p2_cards = []
var p3_cards = []
var p4_cards = []
var p5_cards = []
var player_cards = [p1_cards, p2_cards, p3_cards, p4_cards, p5_cards]
var puntuacions_dict ={}
