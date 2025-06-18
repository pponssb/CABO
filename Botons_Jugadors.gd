extends Control
@onready var botons_container = $Bot_jugadors
func _ready():
	for i in range(1,5):
		var boto = Button.new()
		boto.text=str(i)+"jugador"+("s" if i>1 else "")
		boto.pressed.connect(func(): seleccionar_jugadors(i))
		botons_container.add_child(boto)
func seleccionar_jugadors(num):
	print("El joc procedirà amb",num, "jugador(s)")
