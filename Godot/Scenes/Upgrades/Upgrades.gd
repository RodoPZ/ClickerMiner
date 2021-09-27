extends "res://Scenes/Upgrades/Menuscript.gd"

func focus():
	if focused == "upgrades":
		if Input.is_action_just_pressed("ui_open_buildings_left"):
			get_node("VBoxContainer/"+unidades[focus]+"/Label").hide()
			focus-=1
			if focus <0:
				focus = maxim
		elif Input.is_action_just_pressed("ui_close_buildings_right"):
			get_node("VBoxContainer/"+unidades[focus]+"/Label").hide()
			focus += 1
			if focus >maxim:
				focus = 0	
				
		get_node("VBoxContainer/"+unidades[focus]).grab_focus()
		get_node("VBoxContainer/"+unidades[focus]+"/Label").show()
		if Input.is_action_just_pressed("ui_A"):
			unidades(unidades[focus])
		if focus == maxim:
			get_node("VBoxContainer").set_position(Vector2(-4,16))
		elif focus == 0:
			get_node("VBoxContainer").set_position(Vector2(4,16))

