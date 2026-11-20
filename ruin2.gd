extends Area2D

var entered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if entered == true:
		var tree = get_tree()
		var ruincastle = load("res://ruincastle.tscn").instantiate()
		tree.change_scene_to_node(ruincastle)
		ruincastle.put_player_at_spawn_id(0)
func _on_body_entered(body: Node2D) -> void:
	entered = true


func _on_body_exited(body: Node2D) -> void:
	entered = false
