extends Node

var instances = {
	"menu": null,
	"pause_m": null,
	"c_level": null
}

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	var menu = load("uid://dfs6b64cfoybe")
	if menu:
		instances.menu = menu.instantiate()
		add_child(instances.menu)
	var pause_menu = load("uid://bs3kkrdcbaa30")
	instances.pause_m = pause_menu.instantiate()
	add_child(instances.pause_m)
	move_child(instances.pause_m, -1)
	instances.pause_m.hide()

func _process(delta: float) -> void:
	pass

func start_game():
	instances.menu.queue_free()
	instances.menu = null
	var main = load("uid://dcfub1tbypo17")
	if main:
		instances.c_level = main.instantiate()
		add_child(instances.c_level)
		move_child(instances.c_level, 0)

func quit():
	get_tree().quit()

func quit_to_main_menu():
	var menu = load("uid://dfs6b64cfoybe")
	if menu:
		instances.menu = menu.instantiate()
		add_child(instances.menu)
	instances.c_level.queue_free()
	instances.c_level = null

func pause(thing: bool):
	get_tree().paused = thing
	if thing:
		instances.pause_m.show()
	else:
		instances.pause_m.hide()

func load_level(scene: int):
	if scene == 2:
		var level = load("uid://de2ojt5cxd0hp")
		if level:
			instances.c_level.queue_free()
			instances.c_level = null
			instances.c_level = level.instantiate()
			add_child(instances.c_level)
