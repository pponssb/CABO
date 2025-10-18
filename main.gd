extends Node2D
var p1_cards = []
var p2_cards = []
var p3_cards = []
var p4_cards = []
var p5_cards = []
var full_deck = ["1C", "2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "10C", "JC", "QC", "KC",
"1P", "2P", "3P", "4P", "5P", "6P", "7P", "8P", "9P", "10P", "JP", "QP", "KP",
"1T", "2T", "3T", "4T", "5T", "6T", "7T", "8T", "9T", "10T", "JT", "QT", "KT",
"1D", "2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "10D", "JD", "QD", "KD"]
var current_deck = []

@onready var p1 = $"../p1"
@onready var p2 = $"../p2"
@onready var C1 = $p1/C1
@onready var C2 = $p1/C2
@onready var C3 = $p1/C3
@onready var C4 = $p1/C4
@onready var num_jugadors = $"res://Botons_Jugadors.gd"


func deal_cards(): #posa les 4 cartes a cada jugador
	current_deck=full_deck.duplicate()
	for i in range (4):
		p1_cards.append(carta_nova())
		p2_cards.append(carta_nova())
		p3_cards.append(carta_nova())
		p4_cards.append(carta_nova())
		p5_cards.append(carta_nova())
	print (p1_cards)
	print (p2_cards)
	
func carta_nova():
	var card = current_deck[randi()%current_deck.size()] # divideix un nombre a l'atzar entre el nombre de cartes que hi ha a current_deck i agafa el residu
	current_deck.erase(card)
	return card
func _ready():
	deal_cards()
	C1.card_value = p1_cards [0]
	C2.card_value = p1_cards [1]
	C3.card_value = p1_cards [2]
	C4.card_value = p1_cards [3]
	change_estat(partida.PLAYER_TURN)





func readcard(carta,pos):
	var r=carta[pos]
	return r


func recompte_punts():
	var player_cards = [p1_cards, p2_cards, p3_cards, p4_cards, p5_cards]
	var suma=[]
	var nj = Global.num_jugadors_seleccionats
	for j in range(0,nj):
		var valor=[]
		for i in range(0,4):
			if readcard(player_cards[j][i],0)=="J":
				valor.append(10)
			elif readcard(player_cards[j][i],0)=="Q":
				valor.append(11)
			elif readcard(player_cards[j][i],0)=="K":
				valor.append(0)
			elif readcard(player_cards[j][i],0)=="L":
				valor.append(-1)
			elif readcard(player_cards[j][i],0)=="1":
				if readcard(player_cards[j][i],1)=="0":
					valor.append(10)
				else:
					valor.append(1)
			else:
				valor.append(int(readcard(player_cards[j][i],0)))
		var suma_jugador = valor[0] + valor[1] + valor[2] + valor[3]
		suma.append(suma_jugador)
	print (suma)

func _on_cabo_pressed() -> void:
	recompte_punts()


#---------------------------------------------------------------------------------------------------
#codi torns
@onready var nom_jugador = $"nom_jugador" # Corregida la ruta assumint VBoxContainer
@onready var estat_torn = $"estat_torn"  # Corregida la ruta assumint que UI/TurnStatusLabel està a l'escena superior

# TORN
enum partida {
	IDLE,
	PLAYER_TURN,
	END_TURN_PHASE
}

var nj = Global.num_jugadors_seleccionats

var estat_actual = partida.IDLE




func change_estat(nou_estat):
	estat_actual = nou_estat
	match estat_actual:
		partida.PLAYER_TURN:
			començar_torn_jugador() 
		partida.END_TURN_PHASE:
			fi_torn()


func començar_torn_jugador():
	var nom_jug_actual = Global.jugadors[Global.jugador_actual]
	nom_jugador.text= "Torn de " + nom_jug_actual + "\n Fes clic a dues cartes per revelar-les"


# -----------------------------------------------------------------------------
# Lògica del Torn
# -----------------------------------------------------------------------------

func fi_torn():
	
	# Si 'estat_torn' es carrega correctament, es pot utilitzar
	if is_instance_valid(estat_torn):
		estat_torn.text = "Torn acabat. Espera..."
	
	# Amaga les cartes del jugador anterior
	# hide_cards_for_player(current_player_index)
	
	# Passa al següent jugador de la llista
	Global.jugador_actual += 1
	if Global.jugador_actual >= Global.jugadors.size():
		Global.jugador_actual = 0 # Torna al primer jugador
	
	# Espera un moment per a un efecte visual, si es vol
	await get_tree().create_timer(1.0).timeout
	
	# Comença el torn del nou jugador
	change_estat(partida.PLAYER_TURN)


func _on_fi_torn_pressed() -> void:
	# Si el joc està en l'estat de torn de jugador, permet que acabi el torn
	if estat_actual == partida.PLAYER_TURN:
		change_estat(partida.END_TURN_PHASE)
	else:
		print("No és el torn del jugador actual per acabar.")
