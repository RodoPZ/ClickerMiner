extends Node2D
var focus = 0 
var maxim = 0
var focused = ""
var upgrades = ["Buddy","Jackhammer","Fabrica"]
func _ready():
	maxim = get_node("VBoxContainer").get_child_count()-1

func _physics_process(_delta):
	focus()

func focus():
	if focused == "upgrades":
		get_node("VBoxContainer/TextureButton"+str(focus)).grab_focus()
		if Input.is_action_just_pressed("ui_open_buildings_left"):
			focus-=1
			if focus <0:
				focus = maxim
		elif Input.is_action_just_pressed("ui_close_buildings_right"):
			focus += 1
			if focus >maxim:
				focus = 0

		
	if focus == maxim:
		get_node("VBoxContainer").set_position(Vector2(-4,16))
	elif focus == 0:
		get_node("VBoxContainer").set_position(Vector2(4,16))


func _on_Mainscene_focus(value):
	focused = value
	return focused
