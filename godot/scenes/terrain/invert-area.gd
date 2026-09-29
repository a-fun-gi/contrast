extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.has_method("glitch_toggle"):
			body.glitch_toggle(true)
			await get_tree().create_timer(.3).timeout
			body.glitch_toggle(false)
			body.inverted = true
			print("inverted:true")
	

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.has_method("glitch_toggle"):
			body.glitch_toggle(true)
			await get_tree().create_timer(.3).timeout
			body.glitch_toggle(false)
			body.inverted = false
			print("inverted:false")
