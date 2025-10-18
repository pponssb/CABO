extends Node2D
@onready var jugadors = $HBoxContainer
@onready var C1 = $C1
@onready var C2 = $C2
@onready var C3 = $C3
@onready var C4 = $C4

func _ready():
	for i in range(Global.num_jugadors_seleccionats):
		if i != Global.jugador_actual:
			var button = Button.new()
			button.set_meta("index", i)
			button.connect("pressed", self, "_on_button_pressed")
			button.text = Global.jugadors[i]
			jugadors.add_child(button)

func _on_button_pressed_lambda(index):
	print("Has clicat el jugador: %s" % Global.jugadors[index])
