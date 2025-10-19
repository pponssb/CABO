extends Node2D
@onready var jugadores = $HBoxContainer
@onready var C1 := $C1
@onready var C2 := $C2
@onready var C3 := $C3
@onready var C4 := $C4

func _ready():
	for i in range(Global.num_jugadors_seleccionats):
		if i != Global.jugador_actual:
			var button = Button.new()
			button.text = Global.jugadors[i]
			button.set_meta("index", i)
			button.connect("pressed", _on_button_pressed)
			jugadores.add_child(button)
	var index_actual = Global.jugador_actual
	var key = "p%d_cards" % (index_actual + 1)
	var cartes_actuals = Global.get(key)

	if cartes_actuals == null or cartes_actuals.size() < 4:
		push_error("No s'han trobat 4 cartes per al jugador actual.")
		return
	C1.card_value = cartes_actuals[0]
	C2.card_value = cartes_actuals[1]
	C3.card_value = cartes_actuals[2]
	C4.card_value = cartes_actuals[3]
	var cartes_rival = [C1.card_value,C2.card_value,C3.card_value,C4.card_value]
	print(cartes_rival)

func _on_button_pressed():
	var sender = get_node(get_tree().get_current_scene().get_path_to(self.get_child(get_child_count() - 1)))
	var index = sender.get_meta("index")
	mostrar_carta_rival(index)
	var key = "p%d_cards" % (index + 1)
	var cartes_rival = Global.get(key)

	if cartes_rival == null or cartes_rival.size() < 4:
		push_error("No s'han trobat 4 cartes per al jugador rival %s." % Global.jugadors[index])
		return

	print("Cartes del rival %s: %s" % [Global.jugadors[index], str(cartes_rival)])

	C1.card_value = cartes_rival[0]
	C2.card_value = cartes_rival[1]
	C3.card_value = cartes_rival[2]
	C4.card_value = cartes_rival[3]

func mostrar_carta_rival(index):
	jugadores.visible = false
	C1.visible = true 
	C2.visible = true
	C3.visible = true
	C4.visible = true
