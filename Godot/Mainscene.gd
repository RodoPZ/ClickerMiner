extends Node2D
var on_upgrades = false
var on_unidades = false
var t = 0


func _ready():
	$Score.text = str(Data.player["Player"]["score"])

func _physics_process(delta):
	t += delta * 0.4
	if Input.is_action_just_pressed("ui_open_buildings"):
		if on_upgrades == false:
			on_upgrades = true
			get_node("Menu_buildings").set_position(Vector2(0,0))
	elif Input.is_action_just_pressed("ui_close_buildings"):
		if on_upgrades:
			on_upgrades = false
			get_node("Menu_buildings").set_position(Vector2(112,0))
	
	



