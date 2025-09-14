extends Node2D
@onready var input: LineEdit = $LineEdit
@onready var label: Label = $Label
@onready var preg: Label = $Pregunta
@onready var preg2 = $Pregunta2
@onready var preg3 = $Pregunta3
@onready var preg4 = $Pregunta4
@onready var preg5 = $Pregunta5
var jugadors = Global.num_jugadors_seleccionats
func nom_jugadors(new_text: String) -> void:
	if jugadors == 5:
		preg.visibility_layer=true
	label.text = "Hola " + new_text.to_upper()  +  "\n Benvingut a la partida"
	Global.jugadors.append(new_text.to_upper())
	preg.queue_free()
	input.queue_free()
	print(Global.jugadors)
"func _ready() -> void:
	input.text_submitted.connect(nom_jugadors)"
