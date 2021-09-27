extends AnimatedSprite

onready var animated_sprite : AnimatedSprite = get_node(".")
var Pressed_A = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_A"):
		Pressed_A += 1
		if Pressed_A == 1:
			get_node("Timer").start(1)
			animated_sprite.play("picar1")


	#usar pico
	if Input.is_action_just_pressed("ui_B") and Pressed_A != 0:
		Pressed_A = 0
		Data.player["Player"]["score"] += 1
		animated_sprite.play("picar2")
		get_node("Timer").start(1)
		get_parent().get_node("Score").text = str(Data.player["Player"]["score"])


func _on_Timer_timeout():
	animated_sprite.play("idle")
	Pressed_A = 0
	
