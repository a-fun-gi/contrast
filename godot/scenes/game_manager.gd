extends Node

var menu_i = null
var main_i = null
var pause_m_i = null

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
		main_i = main.instantiate()
		add_child(main_i)
		

func quit():
	get_tree().quit()

func quit_to_main_menu():
	var menu = load("uid://dfs6b64cfoybe")
	if menu:
		menu_i = menu.instantiate()
		add_child(menu_i)
	main_i.queue_free()
	main_i = null
