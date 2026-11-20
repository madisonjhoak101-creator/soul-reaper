extends Node2D
@export var player: Node2D
@export var spawn_positions: Array [Node2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func put_player_at_spawn_id(id:int):
	player.global_position = spawn_positions[0].global_position
