extends PointLight2D

@export var anchor: Anchor

func _ready() -> void:
	var anchor_pulse: Tween = create_tween().set_loops()
	anchor_pulse.tween_property(self, "scale", Vector2.ONE * 15, 1.5)
	anchor_pulse.tween_property(self, "scale", Vector2.ONE * 5, 1.5)

func _on_anchor_hit() -> void:
	print("e")
	var danger_pulse: Tween = create_tween()
	danger_pulse.tween_property(self, "color", Color(1, 0.1, 0.1), 0.5)
	danger_pulse.tween_property(self, "color", Color(1, 0, 0), 0.5)
