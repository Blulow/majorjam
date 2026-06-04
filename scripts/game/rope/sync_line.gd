extends CollisionShape2D

@export var rope_line: Line2D

const width: float = 20.0

func _process(delta: float) -> void:
	var a = rope_line.points[0]
	var b = rope_line.points[1]
	
	position = (a + b) / 2
	rotation = a.direction_to(b).angle()
	shape.set_size(Vector2(a.distance_to(b), width))
