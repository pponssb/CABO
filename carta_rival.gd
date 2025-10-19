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
			print(button.get_meta("index"))
			button.pressed.connect(Callable(self, "_on_button_pressed").bind(i))
			jugadores.add_child(button)



func _on_button_pressed(index):
	var sender = get_node(get_tree().get_current_scene().get_path_to(self.get_child(get_child_count() - 1)))
	print(sender)
	var nom =  Global.jugadors[index]
	print (index)
	mostrar_carta_rival(index)
	var key = "p" + str(index + 1) + "_cards"
	var cartes_rival = Global.get(key)

	if cartes_rival == null or cartes_rival.size() < 4:
		push_error("No s'han trobat 4 cartes per al jugador actual.")
		return
	C1.set_meta("card_value",cartes_rival[0])
	C2.set_meta("card_value",cartes_rival[1])
	C3.set_meta("card_value",cartes_rival[2])
	C4.set_meta("card_value",cartes_rival[3])
	var cartes_mirar = [C1.get_meta("card_value"),C2.get_meta("card_value"),C3.get_meta("card_value"),C4.get_meta("card_value")]
	print(cartes_mirar)


func mostrar_carta_rival(index):
	jugadores.visible = false
	C1.visible = true 
	C2.visible = true
	C3.visible = true
	C4.visible = true
