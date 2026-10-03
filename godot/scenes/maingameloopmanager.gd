extends Node
@onready var player: CharacterBody2D = $"../player"
var health = 6

func _ready():
	pass
	
func change_health(addend):
	health += addend
	print(health)
	if health < 0:
		player.die()
	return health

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		GameManager.pause(true)
