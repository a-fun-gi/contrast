extends Node
@onready var eclipse: AnimatedSprite2D = $"../Parallax2D/eclipse"

var health = 6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	eclipse.frame = 6

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_health(addend):
	health += addend
	eclipse.frame = health  
	print(health)
	return health
