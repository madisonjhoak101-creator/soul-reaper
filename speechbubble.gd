extends PanelContainer

@onready var label: Label = $MarginContainer/Label
@onready var bubble: Node2D = $SpeechBubble
@onready var speechbubble = $SpeechBubble

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if self.visible:
			self.visible = false
		else:
			self.visible = true

func show_dialogue(text: String) -> void:
	label.text = text
	visible = true

func hide_dialogue() -> void:
	visible = false
