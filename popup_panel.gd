extends PopupPanel
@onready var nom_jugador = $"VBoxContainer/nom_jugador" # Corregida la ruta assumint VBoxContainer
@onready var estat_torn = $"VBoxContainer/estat_torn"  # Corregida la ruta assumint que UI/TurnStatusLabel està a l'escena superior

# TORN
enum partida {
	IDLE,
	PLAYER_TURN,
	END_TURN_PHASE
}

var nj = Global.num_jugadors_seleccionats
var jugador_actual = 0
var estat_actual = partida.IDLE

func _ready():
	# El panell no hauria de fer res en 'ready'. Hauria d'esperar la crida del joc principal.
	# Si volem que es mostri immediatament, es pot cridar aquí change_estat()
	# Però el millor és que l'escena principal ho faci.
	pass


func change_estat(nou_estat):
	estat_actual = nou_estat
	match estat_actual:
		partida.PLAYER_TURN:
			# CRIDEM LA NOVA FUNCIÓ EN LLOC DE _ready()
			començar_torn_jugador() 
		partida.END_TURN_PHASE:
			fi_torn()


func començar_torn_jugador():
	# Mètode CORRECTE per mostrar l'objecte actual (el PopupPanel)
	self.popup() 
	
	var nom_jugador_actual = Global.jugadors[jugador_actual]
	
	# Usant la variable 'nom_jugador' (el @onready var)
	# Hem d'assumir que la referència @onready és ara correcta.
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
	# Amaguem el panell quan el torn acaba, utilitzant el mètode CORRECTE
	hide() 
	
	# Si 'estat_torn' es carrega correctament, es pot utilitzar
	if is_instance_valid(estat_torn):
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
