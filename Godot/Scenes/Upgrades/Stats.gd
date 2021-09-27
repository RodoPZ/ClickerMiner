extends Label

func _process(_delta):
	self.text = ("cost - " + str(Data.unidades[get_parent().get_parent().name]["precio"]) + "\n" + str(Data.unidades[get_parent().get_parent().name]["mps"]) + " mps")
