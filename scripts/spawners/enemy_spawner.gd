extends Node2D
class_name EnemySpawner

@export var pattern: SpawnPattern
@export var interval: float = 3.0
@export var count: int = 30
@export var enemy_scene: PackedScene
@export var enemy_target: Node2D
@export var arena: Node2D

var timer: float = 0.0

func _process(delta: float) -> void:
	if timer < interval:
		timer += delta
	else:
		var points: Array[Vector2] = pattern.get_spawn_positions(count)
		for i in points:
			var enemy: Enemy = enemy_scene.instantiate()
			enemy.target = enemy_target
			enemy.global_position = i
			arena.add_child(enemy)
			timer = 0.0
