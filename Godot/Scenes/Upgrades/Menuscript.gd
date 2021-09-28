extends Node2D
var focus = 0 
var maxim = 0
var focused = "None"
signal unidades(value)
var unidades_array = []


func _ready():
	maxim = get_node("VBoxContainer").get_child_count()-1
	for i in range(get_node("VBoxContainer").get_child_count()):
		unidades_array.append(get_node("VBoxContainer").get_child(i).get_name())
		
func _physics_process(_delta):
	gain_focus()

func gain_focus():
	pass

func unidades(value):
	emit_signal("unidades",value)

func _on_Mainscene_focus(value):
	focused = value
	return focused
