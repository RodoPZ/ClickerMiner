extends AnimatedSprite

func _on_Timer_timeout():
	Data.player["Player"]["score"] += Data.unidades["Fabrica"]["mps"]/10

func _on_Poof_animation_finished():
	$Poof.stop()
	$Poof.visible = false


func _on_Fabrica_tree_entered():
	$Poof.visible = true
	$Poof.play("idle")
