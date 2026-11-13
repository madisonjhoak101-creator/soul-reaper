extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var speed: float = 150.0
@export var stop_distance: float = 50.0
@export var player: CharacterBody2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not player == null:
		return
	var direction: Vector2 = global_position.direction_to(player.global_position)
	velocity = direction * speed

	move_and_slide()
