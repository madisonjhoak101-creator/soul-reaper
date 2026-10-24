extends Node2D
@export var speed: float = 150.0
@export var move_direction: Vector2 = Vector2.RIGHT

var should_move: bool = false

@onready var detector: Area2D = $PassengerDetector

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	detector.body_entered.connect(_on_passenger_entered)
	pass # Replace with function body.

func _on_passenger_entered(body: Node2D) -> void:
	if body.is_in_group("soul") and not should_move:
		should_move = true
		body.get_parent().remove_child(body)
		add_child(body)
		body.global_position = global_position + Vector2(0, -20)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
