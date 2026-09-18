extends Node

var health = 6

func _ready():
	pass
	
func change_health(addend):
	health += addend
	print(health)
	return health
