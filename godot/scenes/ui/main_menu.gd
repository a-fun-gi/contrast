extends Control

@onready var game_manager: Node = %GameManager
const MAIN = preload("uid://dcfub1tbypo17")
const MAIN_MENU = preload("uid://dfs6b64cfoybe")

func _on_button_pressed() -> void:
	var instance = MAIN.instantiate()
	add_child(instance)
	#self.queue_free()
