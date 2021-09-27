extends Node2D
var focus = 0 
var maxim = 0
var focused = "None"
func _ready():
	get_node("VBoxContainer/TextureButton"+str(focus)).grab_focus()
	maxim = get_node("VBoxContainer").get_child_count()-1

func _physics_process(_delta):
	focus_buildings()

func focus_buildings():
	if Input.is_action_just_pressed("ui_open_upgrades_up"):
		focus-=1
		if focus <0:
			focus = maxim
	elif Input.is_action_just_pressed("ui_close_upgrades_down"):
		focus += 1
		if focus >maxim:
			focus = 0	
	if focused == "buildings":
		get_node("VBoxContainer/TextureButton"+str(focus)).grab_focus()

func _on_Mainscene_focus(value):
	focused = value
	return focused
