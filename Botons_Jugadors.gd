extends Control

@onready var botons_container = $Bot_jugadors
@onready var njt = $Num_jug_txt

func _ready():
	for i in range(2, 6):
		var boto = Button.new()
		boto.text = str(i) + " jugador" + ("s" if i > 1 else "")
		boto.pressed.connect(func(): seleccionar_jugadors(i))
		botons_container.add_child(boto)

func seleccionar_jugadors(num):
	njt.text = "El joc procedirà amb " + str(num) + " jugadors"
	njt.show()
	for boto in botons_container.get_children():
		botons_container.remove_child(boto)
		boto.queue_free()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
