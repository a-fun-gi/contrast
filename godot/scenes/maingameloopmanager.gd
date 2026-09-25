extends Node
@onready var pause_menu: CanvasLayer = $"../pause_menu"

var health = 6

func _ready():
	pass
	
func change_health(addend):
	health += addend
	print(health)
	return health

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause()

func pause():
	var pause_state = !get_tree().paused
	get_tree().paused = pause_state
	if pause_state:
		pause_menu.show()
	else:
		pause_menu.hide()
