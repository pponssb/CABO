extends Button
@export var carta_amagada: Texture2D = preload ("res://Cards/CD.png")
var card_value: String = ""
var cara_amunt: bool = false
func girar():
	self.cara_amunt = not self.cara_amunt
	if Global.bloqueig_total==true:
		return
	else:
		if self.cara_amunt:
			var carta_mostrada = "res://Cards/" + card_value + ".png"
			self.icon = load(carta_mostrada)
		else:
			self.icon = carta_amagada



func _on_pressed() -> void:
	if Global.cartes_girades.has(self):
		girar()  # Permet girar-la cara avall
		return

	if Global.cartes_girades.size() < 10: # hauria d'aanr un 2 aqui
		girar()  # Girar cara amunt
		Global.cartes_girades.append(self)
	else:
		pass #(Global.bloqueig_total==true //// print("⚠️ Només pots girar dues cartes alhora."))
