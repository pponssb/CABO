extends Node2D

# Aquest diccionari s'hauria de passar des de la funció recompte_punts()


@onready var puntuacions_container: VBoxContainer = $PuntuacionsContainer
@onready var missatge_guanyador: Label = $MissatgeGuanyador

func _ready():
	if get_tree().current_scene == self:
		mostrar_puntuacions()
# Funció que ordena els jugadors per puntuació ascendent (menys punts = guanyador)
func obtenir_jugadors_ordenats(puntuacions_dict: Dictionary) -> Array:
	var parells := []
	for nom in puntuacions_dict.keys():
		parells.append({ "nom": nom, "punts": puntuacions_dict[nom] })

	# Ordenem de menys a més punts
	parells.sort_custom(func(a, b): return a["punts"] - b["punts"])
	return parells


# Funció que mostra les puntuacions i el guanyador (amb menys punts)
func mostrar_puntuacions():
	var jugadors_ordenats := obtenir_jugadors_ordenats(Global.puntuacions_dict)

	# Netegem el contenidor
	for child in puntuacions_container.get_children():
		child.queue_free()

	# Afegim les puntuacions ordenades
	for jugador in jugadors_ordenats:
		var label = Label.new()
		label.text = "%s: %d punts" % [jugador["nom"], jugador["punts"]]
		label.add_theme_font_size_override("font_size", 24)
		label.add_theme_color_override("font_color", Color.WHITE)
		puntuacions_container.add_child(label)

	# Missatge pel guanyador (el que té menys punts)
	var guanyador = jugadors_ordenats[0]
	missatge_guanyador.text = "🏆 Felicitats, %s! Has guanyat amb només %d punts!" % [guanyador["nom"], guanyador["punts"]]
	missatge_guanyador.add_theme_font_size_override("font_size", 32)
	missatge_guanyador.add_theme_color_override("font_color", Color.GOLD)
