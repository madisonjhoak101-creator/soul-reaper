extends CharacterBody2D

@export var detection_range: float = 100.0
@export var speed: float = 50.0
@export var target_position: Vector2 = Vector2(500,300)
@export var player: CharacterBody2D

var is_walking: bool = true

@export var walk_direction: int = 1 # 1 for right, -1 for left

@onready var animated_sprite = $CharacterBody2D2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# play the walk animation automically
	if animated_sprite:
		animated_sprite.play("walk")
	pass # Replace with function body.

func face_player() -> void:
	if player and animated_sprite:
		if player.global_position.x < global_position.x:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false


func _physics_process(delta: float) -> void:
	if player and global_position.distance_to(player.global_position) < detection_range:
		velocity = Vector2.ZERO
		face_player()
	if is_walking:
		walk_to_target()
		if animated_sprite and animated_sprite.animation != "walk":
			animated_sprite.play("walk")
	else:
		velocity = Vector2.ZERO
		face_player()
		if animated_sprite and animated_sprite.animation != "idle":
			animated_sprite.play("idle")
	move_and_slide()
	if is_walking and is_on_wall():
		walk_direction *= -1

func walk_to_target() -> void:
	var direction = (target_position - global_position).normalized()
	velocity = direction * speed
	if animated_sprite and direction.x != 0:
			animated_sprite.flip_h = direction.x < 0
	var distance_to_target = global_position.distance_to(target_position)
	if distance_to_target < 5.0:
		is_walking = false
		return
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
