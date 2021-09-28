extends Label

func _process(_delta):
	self.text = ("cost - " + str(Data.upgrades[get_parent().get_parent().name]["precio"]) + "\n" +"Bonus per rock: " + str(Data.player["Player"]["bonus_piedra"]))
