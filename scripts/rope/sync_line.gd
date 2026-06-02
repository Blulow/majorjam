extends CollisionShape2D

@export var rope_line: Line2D

func _process(delta: float) -> void:
	shape.a = rope_line.points[0]
	shape.b = rope_line.points[1]
