extends AnimatedSprite

onready var animated_sprite : AnimatedSprite = get_node(".")
onready var score_anterior
onready var rock_hp = 11
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.

func _process(_delta):
	damage_rock()
	if rock_hp == 0 and Data.player["Player"]["score"] != score_anterior:	
		Globals.camera.shake(100,.4,100)
		pick_rock()
	score_anterior = Data.player["Player"]["score"];

#spawnea una piedra de determinado tamaño
func pick_rock():
	var rng = floor(rand_range(0,100))
	for i in 4:
		self_modulate.a = 0.2
		yield(get_tree().create_timer(.1), "timeout")
		self_modulate.a = 1.0
		yield(get_tree().create_timer(.1), "timeout")
	if rng < 20:
		animated_sprite.set_frame(random_int(0,4))
		rock_hp = 5
	elif rng > 20 and rng < 40:
		animated_sprite.set_frame(random_int(4,8))
		rock_hp = 10
	else:
		animated_sprite.set_frame(random_int(8,12))
		rock_hp = 15
	
#genera un numero entero entre dos valores
func random_int(min_value,max_value, inclusive_range = false):
	if inclusive_range:
		max_value += 1
	var range_size = max_value - min_value
	return (randi() % range_size) + min_value

func damage_rock():
	if Data.player["Player"]["score"] != score_anterior and Data.player["Player"]["score"] != 0:
		print(1)
		rock_hp -= 1
		var new_particle = load("res://Scenes/Player/Particles2D.tscn").instance()
		add_child(new_particle)
		new_particle.position = Vector2(-5,5)
		var new_particle2 = load("res://Scenes/Player/Particles2D2.tscn").instance()
		add_child(new_particle2)
		new_particle2.position = Vector2(-5,5)
		print(new_particle.emitting)
