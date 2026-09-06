extends CharacterBody2D

@onready var visuals: Node2D = $visuals
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var game_manager: Node = %GameManager

const SPEED = 300.0
const JUMP_VELOCITY = -700.0

func _ready() -> void:
	print("!!! THE SCRIPT IS ALIVE !!!")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("ui_accept"):
		game_manager.change_health(-1)

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
