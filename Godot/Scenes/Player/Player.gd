extends Sprite

onready var animated_sprite : Sprite = get_node(".")
var Pressed_A = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	#Levantar pico
	if Input.is_action_just_pressed("ui_A"):
		Pressed_A += 1
		if Pressed_A == 1:
			if animated_sprite.flip_v == false:
				animated_sprite.flip_v = true
			print(Data.player["Player"]["score"])
	#usar pico
	if Input.is_action_just_pressed("ui_B") and Pressed_A != 0:
		Pressed_A = 0
		Data.player["Player"]["score"] += 1
		animated_sprite.flip_v = false
