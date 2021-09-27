extends Node2D
var focus = 0 
var maxim = 0
var focused = "None"
signal unidades(value)
var unidades = []


func _ready():
	maxim = get_node("VBoxContainer").get_child_count()-1
	for i in range(get_node("VBoxContainer").get_child_count()):
		unidades.append(get_node("VBoxContainer").get_child(i).get_name())
	if self.get_name() == "Menu_buildings":
		var input_metod = []


func _physics_process(_delta):
	focus()

func focus():
	pass

func unidades(value):
	emit_signal("unidades",value)

func _on_Mainscene_focus(value):
	focused = value
	return focused
