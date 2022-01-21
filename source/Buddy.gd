extends AnimatedSprite

func _on_Timer_timeout():
	Data.player["Player"]["score"] += Data.unidades["Buddy"]["mps"]

func _on_Poof_animation_finished():
	$Poof.stop()
	$Poof.visible = false


func _on_Buddy_tree_entered():
	$Poof.visible = true
	$Poof.play("idle")
