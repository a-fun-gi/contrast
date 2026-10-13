extends CanvasLayer
@onready var button_2: Button = $menu/CenterContainer/PanelContainer/VBoxContainer/Button2

func _on_quit_button_pressed() -> void:
	GameManager.quit_to_main_menu()
	GameManager.pause(false)

func _on_back_button_pressed() -> void:
	GameManager.pause(false)

#func _process(delta: float) -> void:
#	if visible:
#		button_2.grab_focus()
#	else:
#		button_2.release_focus()

func _on_visibility_changed() -> void:
	if not is_node_ready():
		return
	if visible:
		button_2.grab_focus()
	else:
		button_2.release_focus()

func _on_options_pressed() -> void:
	var options = load("uid://dgosqhhaqsplc")
	var instance = options.instantiate()
	add_child(instance)
