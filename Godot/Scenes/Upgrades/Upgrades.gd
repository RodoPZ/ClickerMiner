extends "res://Scenes/Upgrades/Menuscript.gd"


func gain_focus():
	if focused == "upgrades":
		if Input.is_action_just_pressed("ui_open_buildings_left"):
			get_node("VBoxContainer/"+unidades_array[focus]+"/Label").hide()
			$SoundMenu2.play()
			focus-=1
			if focus <0:
				focus = maxim
		elif Input.is_action_just_pressed("ui_close_buildings_right"):
			get_node("VBoxContainer/"+unidades_array[focus]+"/Label").hide()
			$SoundMenu2.play()
			focus += 1
			if focus >maxim:
				focus = 0
		
		get_node("VBoxContainer/"+unidades_array[focus]).grab_focus()
		get_node("VBoxContainer/"+unidades_array[focus]+"/Label").show()
		if Input.is_action_just_pressed("ui_A"):
			unidades(unidades_array[focus])
		if focus == maxim:
			get_node("VBoxContainer").set_position(Vector2(-4,16))
		elif focus == 0:
			get_node("VBoxContainer").set_position(Vector2(4,16))
