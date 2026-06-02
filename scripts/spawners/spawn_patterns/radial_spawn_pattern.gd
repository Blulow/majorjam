extends SpawnPattern
class_name RadialSpawnPattern

@export var origin: Vector2
@export var min_radius: float = 800.0
@export var max_radius: float = 900.0

func get_spawn_positions(count: int = 1, context: Dictionary = {}) -> Array[Vector2]:		
	var points: Array[Vector2] = []
	for i in count:
		var point: Vector2 = origin + Vector2.from_angle(randf_range(0, TAU)) * randf_range(min_radius, max_radius)
		points.append(point)
	return points
