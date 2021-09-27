extends Node2D
var on_upgrades = false
var on_buildings = false
var space = [0,0,0]
signal focus(value)

func _ready():
	$Score.text = str(Data.player["Player"]["score"])

func _physics_process(delta):
	menus()
	
func menus():
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

func _on_Menu_buildings_unidades(value):
	if on_buildings:
		var Buddy = preload("res://Scenes/Unidades/Buddy.tscn").instance()
		var Jackhammer = preload("res://Scenes/Unidades/Jackhammer.tscn").instance()
		var Fabrica = preload("res://Scenes/Unidades/Fabrica.tscn").instance()
		
		if value == "Buddy" and space[0]<=9 and Data.player["Player"]["score"] > 10:
			get_node("Unidades/Tile"+str(space[0])).add_child(Buddy)
			space[0] += 1
			Data.player["Player"]["score"]-=10
			
		if value == "Jackhammer" and space[1] <= 9 and Data.player["Player"]["score"] > 10:
			if get_node("Unidades/Tile"+str(space[1])).get_child_count() == 1:
				if get_node("Unidades/Tile"+str(space[1])).get_child(0).get_name() == "Buddy":
					get_node("Unidades/Tile"+str(space[1])).get_child(0).queue_free()
					get_node("Unidades/Tile"+str(space[1])).add_child(Jackhammer)
					space[1] += 1
					Data.player["Player"]["score"]-=10
					
		if value == "Fabrica" and space[2] <=9 and  Data.player["Player"]["score"] > 10:
			if get_node("Unidades/Tile"+str(space[2])).get_child_count() == 1:
				if get_node("Unidades/Tile"+str(space[2])).get_child(0).get_name() == "Jackhammer":
					get_node("Unidades/Tile"+str(space[2])).get_child(0).queue_free()
					get_node("Unidades/Tile"+str(space[2])).add_child(Fabrica)
					space[2] += 1
					Data.player["Player"]["score"]-=10
		print(space)

		
