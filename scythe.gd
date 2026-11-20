extends Node2D

@export var anim_player: AnimatedSprite2D 

func swing() -> void:
	if not anim_player.is_playing():
		anim_player.play("swing")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("swing_scythe"):
		swing()
