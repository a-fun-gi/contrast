extends Control
@onready var button: Button = $CenterContainer/VBoxContainer/Button

func _ready() -> void:
	button.grab_focus()
func _on_play_button_pressed() -> void:
	GameManager.start_game()

func _on_quit_button_pressed() -> void:
	GameManager.quit()

func _on_source_button_pressed() -> void:
	OS.shell_open("https://github.com/a-fun-gi/contrast")
