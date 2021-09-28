extends "res://Scenes/Upgrades/Menuscript.gd"

func gain_focus():

	if focused == "buildings":
		if Input.is_action_just_pressed("ui_open_upgrades_up"):
			$SoundMenu.play()
			get_node("VBoxContainer/"+unidades_array[focus]+"/Label").hide()
			focus-=1
			if focus <0:
				focus = maxim
		elif Input.is_action_just_pressed("ui_close_upgrades_down"):
			$SoundMenu.play()
			get_node("VBoxContainer/"+unidades_array[focus]+"/Label").hide()
			focus += 1
			if focus >maxim:
				focus = 0
		get_node("VBoxContainer/"+unidades_array[focus]).grab_focus()
		get_node("VBoxContainer/"+unidades_array[focus]+"/Label").show()
		
		if Input.is_action_just_pressed("ui_A"):
			unidades(unidades_array[focus])
