extends Label

func _process(_delta):
	self.text = ("cost - " + str(Data.upgrades[get_parent().get_parent().name]["precio"]) + "\n" +"Hammer mps: " + str(Data.unidades["Jackhammer"]["mps"]))
