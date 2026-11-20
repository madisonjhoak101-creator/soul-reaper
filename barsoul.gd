extends CharacterBody2D

@export var player: CharacterBody2D
@export var speed: float = 200.0
@export var stop_distance: float = 50.0

var can_follow: bool = false

func _process(delta: float) -> void:
	if not can_follow or not player:
		return
	# calculate direction vector toward the player
	var direction: Vector2 = global_position.direction_to(player.global_position)
	var distance: float = global_position.distance_to(player.global_position)
	# move toward the player if outside the stop distance
	if distance > stop_distance:
		global_position += direction * speed * delta
func finish_talking() -> void:
	can_follow = true
