extends Node2D
var on_upgrades = false
var on_buildings = false
var space = [0,0,0]
signal focus(value)
#onready var animated_poof : AnimatedSprite = preload("res://Scenes/Player/Poof.tscn").instance()

func _ready():
	$Score.text = str(Data.player["Player"]["score"])
func _process(_delta):
	$Score.text = str(Data.player["Player"]["score"])

func _physics_process(_delta):
	menus()
	
func menus():
	if on_upgrades == false and Input.is_action_just_pressed("ui_open_buildings_left"):
		on_buildings = true
		get_node("Menu_buildings").set_position(Vector2(0,0))
		focused("buildings")
		#$SoundMenu.play()
			
	elif on_buildings and (Input.is_action_just_pressed("ui_close_buildings_right") or Input.is_action_just_pressed("ui_B")):
		on_buildings = false
		get_node("Menu_buildings").set_position(Vector2(112,0))
		focused("None")
		#$SoundMenu.play()
			
	elif on_buildings == false and Input.is_action_just_pressed("ui_open_upgrades_up"):
		on_upgrades = true
		get_node("Menu_upgrades").set_position(Vector2(0,48))
		focused("upgrades")
		#$SoundMenu.play()
			
	elif on_upgrades and (Input.is_action_just_pressed("ui_close_upgrades_down") or Input.is_action_just_pressed("ui_B")):
		on_upgrades = false
		get_node("Menu_upgrades").set_position(Vector2(0,128))
		focused("None")
		#$SoundMenu.play()



func _on_Menu_buildings_unidades(value):
	if on_buildings:
		var Buddy = preload("res://Scenes/Unidades/Buddy.tscn").instance()
		var Jackhammer = preload("res://Scenes/Unidades/Jackhammer.tscn").instance()
		var Fabrica = preload("res://Scenes/Unidades/Fabrica.tscn").instance()
				
		if value == "Buddy" and space[0]<=9 and Data.player["Player"]["score"] >= Data.unidades[value]["precio"]:
			spawn_building(value,Buddy,0,2)
			
		if value == "Jackhammer" and space[1] <= 9 and Data.player["Player"]["score"] >= Data.unidades[value]["precio"]:
			if get_node("Unidades/Tile"+str(space[1])).get_child_count() == 1:
				if get_node("Unidades/Tile"+str(space[1])).get_child(0).get_name() == "Buddy":
					get_node("Unidades/Tile"+str(space[1])).get_child(0).queue_free()
					spawn_building(value,Jackhammer,1,2)

		if value == "Fabrica" and space[2] <=9 and  Data.player["Player"]["score"] >= Data.unidades[value]["precio"]:
			if get_node("Unidades/Tile"+str(space[2])).get_child_count() == 1:
				if get_node("Unidades/Tile"+str(space[2])).get_child(0).get_name() == "Jackhammer":
					get_node("Unidades/Tile"+str(space[2])).get_child(0).queue_free()
					spawn_building(value,Fabrica,2,2)

func _on_Menu_upgrades_unidades(value):
	if on_upgrades:
		if value == "Strength" and Data.player["Player"]["score"] >= Data.upgrades[value]["precio"]:
			player_upgrades(value,"mpc",5)
			
		elif value == "Gems" and Data.player["Player"]["score"] >= Data.upgrades[value]["precio"]:
			player_upgrades(value,"bonus_piedra",5)

		elif value == "Soda" and Data.player["Player"]["score"] >= Data.upgrades[value]["precio"]:
			building_upgrades(value,"Buddy",5)

		elif value == "Gears" and Data.player["Player"]["score"] >= Data.upgrades[value]["precio"]:
			building_upgrades(value,"Jackhammer",5)

		elif value == "Oil" and Data.player["Player"]["score"] >= Data.upgrades[value]["precio"]:
			building_upgrades(value,"Fabrica",5)


func spawn_building(value,names,index,aumento_precio):
	get_node("Unidades/Tile"+str(space[index])).add_child(names)
	$SoundSpawn.play()
	space[index] += 1
	Data.player["Player"]["score"] -= Data.unidades[value]["precio"]
	Data.unidades[value]["precio"] = Data.unidades[value]["precio"]*aumento_precio
	on_buildings = false
	get_node("Menu_buildings").set_position(Vector2(112,0))
	focused("None")


func building_upgrades(value,building,aumento_precio):
	Data.player["Player"]["score"] -= Data.upgrades[value]["precio"]
	#
	Data.unidades[building]["mps"] = ceil(Data.unidades[building]["mps"]*Data.upgrades[value]["efecto"])
	Data.upgrades[value]["precio"] = Data.upgrades[value]["precio"]*aumento_precio
	print(Data.unidades[building]["mps"])
	#
	on_upgrades = false
	get_node("Menu_upgrades").set_position(Vector2(0,128))
	focused("None")


func player_upgrades(value,afected,aumento_precio):
	Data.player["Player"]["score"] -= Data.upgrades[value]["precio"]
	#
	Data.player["Player"][afected] = ceil(Data.player["Player"][afected]*Data.upgrades[value]["efecto"])
	Data.upgrades[value]["precio"] = Data.upgrades[value]["precio"]*aumento_precio
	#
	on_upgrades = false
	get_node("Menu_upgrades").set_position(Vector2(0,128))
	focused("None")


func focused(value):
	emit_signal("focus",value)
