extends Node2D

@onready var anim_player: AnimationPlayer = $Sprite2D/AnimationPlayer

func swing() -> void:
	if not anim_player.is_playing():
		anim_player.play("swing")
