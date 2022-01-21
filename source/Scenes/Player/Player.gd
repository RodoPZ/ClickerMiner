extends AnimatedSprite

onready var animated_sprite : AnimatedSprite = get_node(".")
#onready var sound_mine: AudioStreamPlayer = get_node("SoundMine")
var menus_open = false
var Pressed_A = 0
signal hit_rock()

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_A") and menus_open==false:
		Pressed_A += 1
		if Pressed_A == 1:
			get_node("Timer").start(1)
			animated_sprite.play("picar1")


	#usar pico
	if Input.is_action_just_pressed("ui_B") and Pressed_A != 0 and menus_open==false :
		Pressed_A = 0
		$Soundmine.play()
		Data.player["Player"]["score"] += Data.player["Player"]["mpc"]
		animated_sprite.play("picar2")
		get_node("Timer").start(1)
		emit_signal("hit_rock")


func _on_Timer_timeout():
	animated_sprite.play("idle")
	Pressed_A = 0
	
func _on_Mainscene_focus(value):
	if value != "None":
		menus_open = true
	else:
		menus_open = false
	return menus_open
