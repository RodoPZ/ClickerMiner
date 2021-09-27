extends AnimatedSprite

func _on_Timer_timeout():
	Data.player["Player"]["score"] += Data.unidades["Buddy"]["mps"]
