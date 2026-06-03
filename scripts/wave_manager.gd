extends Node2D
class_name WaveManager

@export var wave_patterns: Array[WavePattern]
@export var enemy_spawner: EnemySpawner
@export var build_applier: BuildApplier

signal wave_start(wave_n)
signal wave_stop

var wave_pattern: WavePattern
var wave_n: int
var active: bool
var duration_timer: float

func _ready() -> void:
	start_wave(preload("res://assets/resources/wave_patterns/wave_1.tres"))

func _process(delta: float) -> void:
	if not active: return
	
	if duration_timer > 0:
		duration_timer -= delta
	else:
		active = false
		enemy_spawner.active = false
		wave_stop.emit()
		get_tree().paused = true

func start_wave(_wave_pattern: WavePattern):
	get_tree().paused = false
	
	wave_pattern = _wave_pattern
	wave_n = wave_pattern.wave_n
	duration_timer = wave_pattern.duration
	active = true
	
	enemy_spawner.interval = wave_pattern.interval
	enemy_spawner.enemy_cap = wave_pattern.enemy_cap
	enemy_spawner.pool = wave_pattern.pool
	enemy_spawner.stat_modifier = wave_pattern.stat_modifier
	enemy_spawner.active = active
	
	build_applier.apply_build(preload("res://assets/resources/builds/health_boost.tres"))
	
	wave_start.emit(wave_n)
