extends Control

func _on_play_button_pressed() -> void:
	GameManager.start_game()

func _on_quit_button_pressed() -> void:
	GameManager.quit()
