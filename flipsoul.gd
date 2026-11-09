extends AnimatedSprite2D
@onready var tutorial_sprite = $AnimatedSprite2D

func _ready() -> void:
	tutorial_sprite.play("tutorial_action")
	tutorial_sprite.flip_h = true
