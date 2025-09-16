extends Node2D
@onready var preg_labels = [$Pregunta, $Pregunta2, $Pregunta3, $Pregunta4, $Pregunta5]
@onready var benvinguda = $Benvinguda
@onready var line_edits = [$Pregunta/LineEdit, $Pregunta2/LineEdit2, $Pregunta3/LineEdit3, $Pregunta4/LineEdit4, $Pregunta5/LineEdit5]
var jugadors_registrats = 0

func _ready() -> void:
	for i in range(5):
		preg_labels[i].hide()

	var num_jugadors = Global.num_jugadors_seleccionats
	for i in range(num_jugadors):
		preg_labels[i].show()
		line_edits[i].text_submitted.connect(nom_registrat)

	benvinguda.hide()

func nom_registrat(text: String) -> void:
	Global.jugadors.append(text.to_upper())
	line_edits[jugadors_registrats].hide()
	preg_labels[jugadors_registrats].hide()
	jugadors_registrats += 1

	if jugadors_registrats >= Global.num_jugadors_seleccionats:
		var noms_unio = ", ".join(Global.jugadors)
		var text_benvinguda = "BENVINGUTS A LA PARTIDA!\n"
		text_benvinguda += noms_unio
	
		benvinguda.text = text_benvinguda
		benvinguda.show()
		print(Global.jugadors)


func on_a_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
