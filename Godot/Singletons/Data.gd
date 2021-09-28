extends Node

var player = {
	"Player": {
	"score": 1000000,
	"mpc": 1, #mpc: Mines per click
	"bonus_piedra": 1,
	"game_over": false,
	"paused": false
	}
}

var unidades = {
	"Buddy": {
		"precio": 10,
		"mps": 1
	},
	
	"Jackhammer": {
		"precio": 2000,
		"mps": 10
	},
	
	"Fabrica": {
		"precio": 30,
		"mps": 100
	}
}
var upgrades = {
	"Strength": {
		"precio": 1,
		"efecto": 4,
	},
	
	"Gems": {
		"precio": 1,
		"efecto": 5,
	},
	
	"Soda": {
		"precio": 1,
		"efecto": 1.5,
	},
	
	"Gears": {
		"precio": 1,
		"efecto": 2,
	},
	
	"Oil": {
		"precio": 1,
		"efecto": 2.5,
	}	
}
