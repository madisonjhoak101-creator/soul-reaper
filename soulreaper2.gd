extends CharacterBody2D
@onready var sprite = $Sprite2D2
@export var detection_range: float = 100.0
@export var speed: float = 50.0
@export var target_position: Vector2 = Vector2(500,300)
@export var reaper: CharacterBody2D
var is_moving = false
const SPEED =300.0
var is_walking: bool = true
@export var walk_direction: int = 1 # 1 for right, -1 for left
@onready var animated_sprite = $CharacterBody2D2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if sprite:
		sprite.visible = false
	# play the walk animation automically
	if animated_sprite:
		animated_sprite.play("walk")
	pass # Replace with function body.
func move_to(destination: Vector2):
	target_position = destination
	is_moving = true
	is_walking = false
	if sprite:
		sprite.visible = false
func face_player() -> void:
	if reaper:
		var target_node = animated_sprite if animated_sprite else sprite
		if target_node:
			if reaper.global_position.x < global_position.x:
				target_node.flip_h = true
			else:
				target_node.flip_h = false
func walk_to_target() -> void:
	var direction = (target_position - global_position).normalized()
	velocity = direction * speed
	if animated_sprite:
		if direction.x != 0:
			animated_sprite.flip_h = direction.x < 0
		if animated_sprite.animation != "walk":
			animated_sprite.play("walk")
	var distance_to_target = global_position.distance_to(target_position)
	if distance_to_target < 5.0:
		is_walking = false
		velocity = Vector2.ZERO
	move_and_slide()
func flip_sprite(left: bool) -> void:
	var target_node = animated_sprite if animated_sprite else sprite
	if target_node:
		target_node.flip_h = left
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("flip_left"):
		flip_sprite(true)
	if reaper and global_position.distance_to(reaper.global_position) < detection_range:
		velocity = Vector2.ZERO
		face_player()
		if animated_sprite and animated_sprite.animation != "idle":
			animated_sprite.play("idle")
		move_and_slide()
		return
	if is_walking:
		walk_to_target()
	else:
		velocity = Vector2.ZERO
		face_player()
		if animated_sprite and animated_sprite.animation != "idle":
			animated_sprite.play("idle")
		move_and_slide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
