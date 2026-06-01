extends Line2D

@export var rope: Node2D

func _process(delta: float) -> void:
	points = [
		to_local(rope.obj1.global_position),
		to_local(rope.obj2.global_position)
	]
