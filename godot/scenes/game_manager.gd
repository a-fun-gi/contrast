extends Node

var menu_i = null
var main_i = null
var pause_m_i = null
var c_level = null

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	var menu = load("uid://dfs6b64cfoybe")
	if menu:
		menu_i = menu.instantiate()
		add_child(menu_i)
	var pause_menu = load("uid://bs3kkrdcbaa30")
	pause_m_i = pause_menu.instantiate()
	add_child(pause_m_i)
	move_child(pause_m_i, -1)
	pause_m_i.hide()

func _process(delta: float) -> void:
	pass

func start_game():
	menu_i.queue_free()
	menu_i = null
	var main = load("uid://dcfub1tbypo17")
	if main:
		main_i = main.instantiate()
		add_child(main_i)
		move_child(main_i, 0)

func quit():
	get_tree().quit()

func quit_to_main_menu():
	var menu = load("uid://dfs6b64cfoybe")
	if menu:
		menu_i = menu.instantiate()
		add_child(menu_i)
	main_i.queue_free()
	main_i = null

func pause(thing: bool):
	get_tree().paused = thing
	if thing:
		pause_m_i.show()
	else:
		pause_m_i.hide()

func load_level(scene: int):
	if scene == 2:
		var level = load("uid://de2ojt5cxd0hp")
		if level:
			c_level = level.instantiate()
			add_child(c_level)
			main_i.queue_free()
			main_i = null
