extends Control
@onready var vol_slider: HSlider = $CenterContainer/VBoxContainer/HSlider
@onready var check_button: CheckButton = $CenterContainer/VBoxContainer/CheckButton
@onready var shader_intensity: HSlider = $CenterContainer/VBoxContainer/HSlider2

func _ready() -> void:
	vol_slider.value = GameManager.data.volume
	shader_intensity.value = GameManager.data.shader_intensity

func _on_h_slider_value_changed(value: float) -> void:
	GameManager.data.volume = value

func _on_exit_pressed() -> void:
	GameManager.apply_settings()
	GameManager.save()
	queue_free()

func _on_shader_slider_value_changed(value: float) -> void:
	GameManager.data.shader_intensity = value
