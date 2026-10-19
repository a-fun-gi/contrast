extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.has_method("die"):
		body.reset()
		var health = GameManager.change_health(-1)
		if health < 0:
			body.die()
