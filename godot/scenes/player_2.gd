extends CharacterBody2D

@onready var visuals: Node2D = $visuals
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var loop_manager: Node = %LoopManager
@onready var poly: Node2D = $visuals/polygons
@export var inverted: bool = false
@export var unstable: bool = false

const SPEED = 300.0
const JUMP_VELOCITY = -700.0

var lastpos: Vector2

func _ready() -> void:
	print("!!! THE SCRIPT IS ALIVE !!!")
	lastpos = global_position
	# glitch_toggle(true)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	#if is_on_floor():
	#	lastpos = global_position

	# Handle jump.
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("ui_accept"):
		loop_manager.change_health(-1)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("player_left", "player_right")
	if direction > 0:
		visuals.scale.x = 1
	elif direction < 0:
		visuals.scale.x = -1
	if is_on_floor():
		if direction == 0:
			animation_player.play("rest")
		else:
			animation_player.play("walk")
	else:
		animation_player.play("jump")
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	if is_on_floor():
		for i in range(get_slide_collision_count()):
			var collision = get_slide_collision(i)
			var collider = collision.get_collider()
				
			if collider is StaticBody2D:
				lastpos = global_position
				break

func reset():
	global_position = lastpos
	velocity = Vector2.ZERO

func glitch_toggle(toggle: bool):
	for part in poly.get_children():
		if part is Polygon2D:
			part.set_instance_shader_parameter("enable_shader", toggle)
	#print("toggled")
	

func _on_ripple_body_entered(body: CharacterBody2D) -> void:
	print("entered unstable area")
	unstable = true

func _on_ripple_body_exited(body: CharacterBody2D) -> void:
	print('exited unstable area')
	unstable = false
