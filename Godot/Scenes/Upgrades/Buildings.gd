extends Node2D
var focus = 0 
var maxim = 0
var focused = "None"
var unidades = ["Buddy","Jackhammer","Fabrica"]
signal unidades(value)

func _ready():
	maxim = get_node("VBoxContainer").get_child_count()-1
<<<<<<< HEAD
func _physics_process(delta):
	focus()

func focus():
=======

func _physics_process(delta):
	focus()

<<<<<<< HEAD
func focus_buildings():
>>>>>>> 532eb4f87e83564ee6a4613135e46b7669091ed2
=======
func focus():
	print(focused)
>>>>>>> parent of 9b92078 (score buildings)
	if Input.is_action_just_pressed("ui_open_upgrades_up"):
		focus-=1
		if focus <0:
			focus = maxim
	elif Input.is_action_just_pressed("ui_close_upgrades_down"):
		focus += 1
		if focus >maxim:
			focus = 0	
	if focused == "buildings":
		get_node("VBoxContainer/"+unidades[focus]).grab_focus()
	if Input.is_action_just_pressed("ui_A"):
		unidades(unidades[focus])

func unidades(value):
	emit_signal("unidades",value)

func _on_Mainscene_focus(value):
	focused = value
	return focused
