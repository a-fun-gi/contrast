extends Area2D
@onready var label: Label = $Label
@export var text: String

func _ready() -> void:
	if label.ready:
		label.text = text
func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		label.show()

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		label.hide()
