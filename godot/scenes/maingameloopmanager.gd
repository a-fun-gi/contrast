extends Node
@onready var eclipse: AnimatedSprite2D = $"../Parallax2D/eclipse"
var health = 6
func _ready():
	eclipse.frame = 6
func change_health(addend):
	health += addend
	eclipse.frame = health  
	print(health)
	return health
