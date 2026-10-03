extends CanvasLayer
@onready var loop_manager: Node = %LoopManager
@export var life_textures: Array[Texture2D]
@onready var rect: TextureRect = $hud/AspectRatioContainer/TextureRect
@onready var player: CharacterBody2D = $"../player"
@onready var bar: ColorRect = $"hud/move this"

var life
var past: int = 0

func _ready() -> void:
	_update_life_display()

func _process(delta: float) -> void:
	_update_life_display()

func _update_life_display() -> void:
	life = loop_manager.health
	if life_textures.size() > 0:
		rect.texture = life_textures[life]
	if player.unstable:
		if player.inverted and bar.scale.x > -1:
			bar.scale.x -= 0.0045
		elif not player.inverted and bar.scale.x < 1:
			bar.scale.x += 0.0045
		if (bar.scale.x >= 1 or bar.scale.x <= -1) and (Time.get_ticks_msec() >= past + 1000):
			loop_manager.change_health(-1)
			past = Time.get_ticks_msec()
	else:
		bar.scale.x = 0
