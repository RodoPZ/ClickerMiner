extends Node

var player = {
	"Player": {
	"score": 0,
	"mpc": 1, #mpc: Mine per click
	"game_over": false,
	"paused": false
	}
}

var unidades = {
	"Buddy": {
		"costo": 1,
		"mps": 1
	},
	
	"Jackhammer": {
		"costo": 5,
		"mps": 10
	},
	
	"Fabrica": {
		"costo": 10,
		"mps": 100
	}
}
