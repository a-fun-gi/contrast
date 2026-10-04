extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if GameManager.instances.c_level.scene_file_path == "res://scenes/main.tscn":
			GameManager.load_level(2)
		elif GameManager.instances.c_level.scene_file_path == "res://scenes/main_2.tscn":
			GameManager.load_level(3)
