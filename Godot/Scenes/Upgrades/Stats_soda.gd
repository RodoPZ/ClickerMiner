extends Label

func _process(_delta):
	self.text = ("cost - " + str(Data.upgrades[get_parent().get_parent().name]["precio"]) + "\n" +"Buddy mps: " + str(Data.unidades["Buddy"]["mps"]))
