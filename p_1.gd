extends Node2D
@onready var input: LineEdit = $LineEdit
@onready var label: Label = $Label
@onready var preg: Label = $Pregunta
@onready var bot1: Button = $p1/C1
@onready var bot2: Button = $p1/C2
@onready var bot3: Button = $p1/C3
@onready var bot4: Button = $p1/C4
func _ready() -> void:
	input.text_submitted.connect(nom_jugadors)

func nom_jugadors(new_text: String) -> void:
	label.text = "Hola " + new_text.to_upper()  +  "\n Fes clic a les cartes per revelar-les"
	preg.queue_free()
	input.queue_free()
	


func _ready2():
	girar_carta()

func girar_carta() -> void:
	bot1.pressed.connect(Callable(self, "_on_boto_pressed").bind(bot1))
	bot2.pressed.connect(Callable(self, "_on_boto_pressed").bind(bot2))
	bot3.pressed.connect(Callable(self, "_on_boto_pressed").bind(bot3))
	bot4.pressed.connect(Callable(self, "_on_boto_pressed").bind(bot4))


func _on_boto_pressed(bot: Button) -> void:
	var missatge = "Has premut: " + bot.name
	print(missatge)            # surt a la consola
