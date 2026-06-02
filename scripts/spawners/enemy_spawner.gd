extends Node2D
class_name EnemySpawner

@export var wave_pattern: WavePattern
@export var arena: Node2D

var active: bool
var wave_n: int
var duration_timer: float
var spawn_timer: float = 0.0

func _ready() -> void:
	start_wave(preload("res://assets/resources/wave_patterns/wave_1.tres"))

func start_wave(_wave_pattern: WavePattern):
	wave_pattern = _wave_pattern
	wave_n = wave_pattern.wave_n
	duration_timer = wave_pattern.duration
	active = true

func _process(delta: float) -> void:
	if not active: return
	
	if spawn_timer < wave_pattern.interval:
		spawn_timer += delta
	else:
		if len(get_tree().get_nodes_in_group("enemy")) < wave_pattern.enemy_cap:
			var weights: Array = wave_pattern.pool.map(func(e): return e.weight)
			var pool_data: PoolData = weighted_rand(wave_pattern.pool, weights)
			spawn_enemies(pool_data.enemy_scene, pool_data.count, pool_data.spawn_pattern, pool_data.target)
		spawn_timer = 0.0
	
	if duration_timer > 0:
		duration_timer -= delta
	else:
		active = false

func spawn_enemies(enemy_scene: PackedScene, count: int, spawn_pattern: SpawnPattern, target: NodePath):
	var points: Array[Vector2] = spawn_pattern.get_spawn_positions(count)
	for i in points:
		var enemy: Enemy = enemy_scene.instantiate()
		enemy.target = get_tree().current_scene.get_node(target)
		enemy.global_position = i
		enemy.get_node("Health").health *= wave_pattern.stat_modifier.health_modifier
		enemy.get_node("Hitbox").damage_amount *= wave_pattern.stat_modifier.damage_modifier
		arena.add_child(enemy)

func weighted_rand(items: Array, weights: Array):
	var total_weight: float = weights.reduce(func(a, b): return a + b)
	var rand: float = randf() * total_weight
	for i in len(items):
		if rand < weights[i]:
			return items[i]
		rand -= weights[i]
