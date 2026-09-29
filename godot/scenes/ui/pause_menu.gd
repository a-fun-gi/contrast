extends CanvasLayer

func _on_quit_button_pressed() -> void:
	GameManager.quit_to_main_menu()
	GameManager.pause(false)

func _on_back_button_pressed() -> void:
	GameManager.pause(false)
