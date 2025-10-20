extends Node2D
@onready var ct_agaf = $ct_agafada
@onready var C1 = $C1
@onready var C2 = $C2
@onready var C3 = $C3
@onready var C4 = $C4
@onready var ins = $"Instrucció"
@onready var msg = $msg_final

func _ready():
	msg.visibility_layer=false
func _on_c_1_pressed() -> void:
	ins.visibility_layer = false
	C1.visibility_layer=false
	await get_tree().create_timer(1.0).timeout
	ct_agaf.visibility_layer=false
	await get_tree().create_timer(1.0).timeout
	C1.visibility_layer=true
	msg.visibility_layer=true
	
func _on_c_2_pressed() -> void:
	ins.visibility_layer = false
	C2.visibility_layer=false
	await get_tree().create_timer(1.0).timeout
	ct_agaf.visibility_layer=false
	await get_tree().create_timer(1.0).timeout
	C2.visibility_layer=true
	msg.visibility_layer=true

func _on_c_3_pressed() -> void:
	ins.visibility_layer = false
	C3.visibility_layer=false
	await get_tree().create_timer(1.0).timeout
	ct_agaf.visibility_layer=false
	await get_tree().create_timer(1.0).timeout
	C3.visibility_layer=true
	msg.visibility_layer=true

func _on_c_4_pressed() -> void:
	ins.visibility_layer = false
	C4.visibility_layer=false
	await get_tree().create_timer(1.0).timeout
	ct_agaf.visibility_layer=false
	await get_tree().create_timer(1.0).timeout
	C4.visibility_layer=true
	msg.visibility_layer=true
