extends PopupPanel
@onready var nom_jugador = $"Window/VBoxContainer/nom_jugador"
@onready var estat_torn = $UI/TurnStatusLabel
func _ready():
	change_estat(partida.PLAYER_TURN)
#TORN
enum partida {
	IDLE,
	PLAYER_TURN,
	END_TURN_PHASE
}

var nj =Global.num_jugadors_seleccionats
var jugador_actual = 0
var estat_actual = partida.IDLE

func change_estat(nou_estat):
	estat_actual = nou_estat
	match estat_actual:
		partida.PLAYER_TURN:
			començar_torn_jugador()
		partida.END_TURN_PHASE:
			fi_torn()

func començar_torn_jugador():
	var nom_jugador_actual = Global.jugadors[jugador_actual]
	nom_jugador.text = "Torn de: " + nom_jugador_actual
	
	# Aquí hauries de mostrar les cartes del jugador actual
	# show_cards_for_player(current_player_index)

# Aquesta funció s'ha de cridar des d'un botó o una altra acció del jugador
func fi_torn_pressed():
	# Si el joc està en l'estat de torn de jugador, permet que acabi el torn
	if estat_actual == partida.PLAYER_TURN:
		change_estat(partida.END_TURN_PHASE)
	else:
		print("No és el torn del jugador actual per acabar.")

# -----------------------------------------------------------------------------
# Lògica del Torn
# -----------------------------------------------------------------------------

func fi_torn():
	estat_torn.text = "Torn acabat. Espera..."
	
	# Amaga les cartes del jugador anterior
	# hide_cards_for_player(current_player_index)
	
	# Passa al següent jugador de la llista
	jugador_actual += 1
	if jugador_actual >= Global.jugadors.size():
		jugador_actual = 0 # Torna al primer jugador
	
	# Espera un moment per a un efecte visual, si es vol
	await get_tree().create_timer(1.0).timeout
	
	# Comença el torn del nou jugador
	change_estat(partida.PLAYER_TURN)
