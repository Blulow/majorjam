extends Node2D
class_name WaveManager

@export var wave_patterns: Array[WavePattern]
@export var enemy_spawner: EnemySpawner
@export var build_applier: BuildApplier

signal wave_start(wave_n)
signal wave_stop

var wave_pattern: WavePattern
var wave_n: int
var current_wave_index: int
var active: bool
var duration_timer: float

func _ready() -> void:
	current_wave_index = 5
	start_wave(wave_patterns[current_wave_index])

func _process(delta: float) -> void:
	if not active: return
	
	if duration_timer > 0:
		duration_timer -= delta
	else:
		active = false
		enemy_spawner.active = false
		current_wave_index += 1
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
	
	wave_start.emit(wave_n)
