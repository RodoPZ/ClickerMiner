extends Node2D
var on_upgrades = false
var on_buildings = false
var t = 0
signal focus(value)

func _ready():
	$Score.text = str(Data.player["Player"]["score"])

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_open_buildings_left") and on_upgrades == false:
		if on_buildings == false:
			on_buildings = true
			get_node("Menu_buildings").set_position(Vector2(0,0))
			focused("buildings")
			
	elif Input.is_action_just_pressed("ui_close_buildings_right"):
		if on_buildings:
			on_buildings = false
			get_node("Menu_buildings").set_position(Vector2(112,0))
			focused("None")
			
	elif Input.is_action_just_pressed("ui_open_upgrades_up") and on_buildings == false:
		if on_upgrades == false:
			on_upgrades = true
			get_node("Menu_upgrades").set_position(Vector2(0,48))
			focused("upgrades")
			
	elif Input.is_action_just_pressed("ui_close_upgrades_down"):
		if on_upgrades:
			on_upgrades = false
			get_node("Menu_upgrades").set_position(Vector2(0,128))
			focused("None")

func focused(value):
	emit_signal("focus",value)


