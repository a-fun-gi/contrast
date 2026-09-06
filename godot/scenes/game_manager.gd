extends Node

var menu_i = null

func _ready() -> void:
	var menu = load("uid://dfs6b64cfoybe")
	if menu:
		menu_i = menu.instantiate()
		add_child(menu_i)

func _process(delta: float) -> void:
	pass

func start_game():
	menu_i.queue_free()
	menu_i = null
	var main = load("uid://dcfub1tbypo17")
	if main:
		var instance = main.instantiate()
		add_child(instance)
		
