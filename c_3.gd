extends Button
@export var carta_amagada: Texture2D = preload ("res://Cards/CD.png")
var card_value: String = ""
var cara_amunt: bool = false
func girar():
	cara_amunt = not cara_amunt
	if cara_amunt:
		var carta_mostrada = "res://Cards/" + card_value + ".png"
		self.icon = load(carta_mostrada)
	else:
		self.icon = carta_amagada





func _on_pressed() -> void:
	girar()
