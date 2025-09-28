extends Button
var full_deck = ["1C", "2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "10C", "JC", "QC", "KC",
"1P", "2P", "3P", "4P", "5P", "6P", "7P", "8P", "9P", "10P", "JP", "QP", "KP",
"1T", "2T", "3T", "4T", "5T", "6T", "7T", "8T", "9T", "10T", "JT", "QT", "KT",
"1D", "2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "10D", "JD", "QD", "KD"]
var current_deck = full_deck.duplicate()
@onready var dc = $"../../drawn_card"
@onready var accions_bt = $"../../accions"
@onready var descartar_bt = $"../../accions/Descartar"
@onready var Accio_bt = $"../../accions/Accio"
@onready var canv_ct_bt = $"../../accions/Canviar_carta"
@onready var setvuit_label = $"7o8"
var descarts =[]


func carta_nova():
	var card = current_deck[randi()%current_deck.size()] # divideix un nombre random entre el nombre de cartes que hi ha a current_deck i agafa el residu
	current_deck.erase(card)
	var carta_agafada = "res://Cards/" + card + ".png"
	dc.texture_normal = load(carta_agafada)
	print(card)
	return card

func _on_pressed():
	var carta_nova_resultat = carta_nova()
	Global.carta_actual=[carta_nova_resultat]
	accions_bt.visible = true

	if carta_nova_resultat[0] == "7" or carta_nova_resultat[0] == "8":
		Accio_bt.visible = true
	elif carta_nova_resultat[0] == "9" or carta_nova_resultat[1] == "0":
		Accio_bt.visible = true
	elif carta_nova_resultat[0] == "J" or carta_nova_resultat[0] == "Q":
		Accio_bt.visible = true
	elif carta_nova_resultat[0] == "K":
		Accio_bt.visible = true

func _on_descartar_pressed() -> void:
	Accio_bt.visible = false
	var descarts_bt = $"../DESCARTS"
	descarts_bt.icon = dc.texture_normal
	dc.texture_normal = $"res://Cards/CD.png"
func _on_canviar_carta_pressed() -> void:
	Accio_bt.visible = false
	get_tree().change_scene_to_file("res://canviar_carta.tscn")
	
func readcard(carta,pos):
	var r=carta[pos]
	return r

func _on_accio_pressed() -> void:
	accions_bt.visible = false
	
	var carta_nova_resultat = Global.carta_actual[0]
	print(carta_nova_resultat[0])
	if carta_nova_resultat[0] == "7" or carta_nova_resultat[0] == "8":
		if is_instance_valid(setvuit_label):
			setvuit_label.text = "Pots revelar una de les teves cartes"
		else:
			print("ERROR: El botó de carta no té una textura assignada.")
	Global.carta_actual.clear()
