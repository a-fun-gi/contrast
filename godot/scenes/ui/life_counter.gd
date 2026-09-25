extends CanvasLayer
@onready var loop_manager: Node = %LoopManager
@export var life_textures: Array[Texture2D]
@onready var rect: TextureRect = $hud/AspectRatioContainer/TextureRect
@onready var player: CharacterBody2D = $"../player"
@onready var bar: ColorRect = $"hud/move this"

var life

func _ready() -> void:
	_update_life_display()

func _process(delta: float) -> void:
	_update_life_display()

func _update_life_display() -> void:
	life = loop_manager.health
	if life_textures.size() > 0:
		# Swaps the display texture to the matching PNG file
		rect.texture = life_textures[life]
	if player.unstable:
		if player.inverted and bar.scale.x > -1:
			bar.scale.x -= 0.0045
		elif not player.inverted and bar.scale.x < 1:
			bar.scale.x += 0.0045
	else:
		bar.scale.x = 0
