extends Area2D

func _on_body_entered(body: CharacterBody2D) -> void:
	if body.has_method("glitch_toggle"):
		body.glitch_toggle(true)
		await get_tree().create_timer(.3).timeout
		body.glitch_toggle(false)

func _on_body_exited(body: CharacterBody2D) -> void:
	if body.has_method("glitch_toggle"):
		body.glitch_toggle(true)
		await get_tree().create_timer(.3).timeout
		body.glitch_toggle(false)
