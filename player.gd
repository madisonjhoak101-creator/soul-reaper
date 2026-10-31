extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_velocity: float = -400.0
@export var gravity: float = 980.0

var is_swinging: bool = false
var swing_anchor: Vector2 = Vector2.ZERO
var rope_length: float = 100.0

func _physics_process(delta: float) -> void:
	# 1. gravity
	if not is_on_floor() and not is_swinging:
		velocity.y += gravity * delta
	#2. jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		is_swinging = false
