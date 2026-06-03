extends Node2D
class_name EnemySpawner

@export var arena: Node2D
@export var interval: float
@export var active: bool
@export var enemy_cap: int
@export var pool: Array[PoolData]
@export var stat_modifier: StatModifier

var spawn_timer: float = 0.0

func _process(delta: float) -> void:
	if not active: return
	
	if spawn_timer < interval:
		spawn_timer += delta
	else:
		if len(get_tree().get_nodes_in_group("enemy")) < enemy_cap:
			var weights: Array = pool.map(func(e: PoolData): return e.weight)
			var pool_data: PoolData = weighted_rand(pool, weights)
			spawn_enemies(pool_data.enemy_scene, pool_data.count, pool_data.spawn_pattern, pool_data.target)
		spawn_timer = 0.0

func spawn_enemies(enemy_scene: PackedScene, count: int, spawn_pattern: SpawnPattern, target: NodePath):
	var points: Array[Vector2] = spawn_pattern.get_spawn_positions(count)
	for i in points:
		var enemy: Enemy = enemy_scene.instantiate()
		enemy.target = get_tree().current_scene.get_node(target)
		enemy.global_position = i
		enemy.get_node("Health").health *= stat_modifier.health_modifier + 1
		if enemy.get_node("Hitbox"):
			enemy.get_node("Hitbox").damage_amount *= stat_modifier.damage_modifier + 1
		arena.add_child(enemy)

func weighted_rand(items: Array, weights: Array):
	var total_weight: float = weights.reduce(func(a, b): return a + b)
	var rand: float = randf() * total_weight
	for i in len(items):
		if rand < weights[i]:
			return items[i]
		rand -= weights[i]
