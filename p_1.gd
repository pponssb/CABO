extends Node2D
@onready var bot1: Button = $p1/C1
@onready var bot2: Button = $p1/C2
@onready var bot3: Button = $p1/C3
@onready var bot4: Button = $p1/C4
	
func _ready2():
	girar_carta()
func girar_carta() -> void:
	bot1.pressed.connect(Callable(self, "_on_boto_pressed").bind(bot1))
	bot2.pressed.connect(Callable(self, "_on_boto_pressed").bind(bot2))
	bot3.pressed.connect(Callable(self, "_on_boto_pressed").bind(bot3))
	bot4.pressed.connect(Callable(self, "_on_boto_pressed").bind(bot4))
