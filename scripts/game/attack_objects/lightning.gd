extends Node2D
class_name Lightning

@onready var range: Area2D = $Range
var lightning_scene: PackedScene = preload("res://scenes/attack_objects/lightning_object.tscn")

func attack(enemy: Enemy, count: int, arena: Node2D) -> void:
	position = enemy.position
	
	var overlapping_enemies: Array[Enemy] = get_enemies_in_range(300.0)
	
	for i in count:
		var next_enemy: Enemy
		var enemy_dist: float
		
		if len(overlapping_enemies) > 0:
			for e: Enemy in overlapping_enemies:
				#if not e.is_in_group("enemy"): continue
				if e == enemy or not e: continue
				
				if next_enemy == null or enemy_dist == null:
					next_enemy = e
					enemy_dist = position.distance_squared_to(e.position)
				else:
					if position.distance_squared_to(e.position) < enemy_dist:
						next_enemy = e
						enemy_dist = position.distance_squared_to(e.position)

		var lightning: Line2D = lightning_scene.instantiate()
		if next_enemy == null:
			lightning.points = [position, position + Vector2.from_angle(randf() * TAU) * randf() * 50]
		else:
			lightning.points = [position, next_enemy.position]
			position = next_enemy.position
		
		arena.add_child(lightning)
		
		await get_tree().create_timer(0.1).timeout
	
	queue_free()

func get_enemies_in_range(range: float) -> Array[Enemy]:
	var shape: CircleShape2D = CircleShape2D.new()
	shape.radius = range
	var query: PhysicsShapeQueryParameters2D = PhysicsShapeQueryParameters2D.new()
	query.shape = shape
	query.transform = Transform2D(0, global_position)
	query.collision_mask = 2
	
	var collisions: Array[Dictionary] = get_world_2d().direct_space_state.intersect_shape(query)
	var enemies: Array[Enemy]
	for i: Dictionary in collisions:
		if i.collider is Enemy:
			enemies.append(i.collider)
	return enemies

#func _on_range_body_exited(body: Node2D) -> void:
	#print("ee", body)
	#overlapping_enemies.erase(body)
	#print(overlapping_enemies, "e")
