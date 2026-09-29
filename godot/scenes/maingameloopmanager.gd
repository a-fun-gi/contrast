extends Node

var health = 6

func _ready():
	pass
	
func change_health(addend):
	health += addend
	print(health)
	return health

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		GameManager.pause(true)
