extends Node

const save_location = "user://save.json"

var data: Dictionary = {
	"health": 6,
	"volume": 1,
	"shader_intensity": 20,
	"position": 1
}

var instances = {
	"menu": null,
	"pause_m": null,
	"c_level": null
}

var level
@onready var player: CharacterBody2D = %player
@export var ripple: ShaderMaterial = preload("uid://bmp1camg161m8")

func _ready() -> void:
	_load()
	apply_settings()
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
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
		print(instances.c_level)

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
	instances.c_level.queue_free()
	instances.c_level = null
	if scene == 2:
		level = load("uid://de2ojt5cxd0hp")
	elif scene == 3:
		level = load("uid://dalljrllho4cs")
	if level:
		instances.c_level = level.instantiate()
		add_child(instances.c_level)

func change_health(addend):
	data.health += addend
	print(data.health)
	return data.health

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		pause(true)

func apply_settings():
	# volume
	var master_bus = AudioServer.get_bus_index("Master")
	var db_val = linear_to_db(data.volume)
	AudioServer.set_bus_volume_db(master_bus, db_val)
	# shaders
	ripple.set_shader_parameter("wave_count", data.shader_intensity)

func save():
	var file = FileAccess.open(save_location, FileAccess.WRITE)
	file.store_var(data)
	file.close()

func _load():
	if FileAccess.file_exists(save_location):
		var file = FileAccess.open(save_location, FileAccess.READ)
		var file_data = file.get_var()
		file.close()
		data = file_data
