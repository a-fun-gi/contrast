extends Area2D
@onready var loop_manager: Node = %LoopManager

func _on_body_entered(body: CharacterBody2D) -> void:
	body.reset()
	loop_manager.change_health(-1)
