extends Node2D
class_name PlayerStatsUpdater

@export var wave_manager: WaveManager
@export var anchor: Anchor
@export var rope: Rope
@export var player: CharacterBody2D

func _ready() -> void:
	wave_manager.wave_start.connect(_on_wave_start)
	anchor.hit.connect(_on_hit)

func _on_wave_start(wave_n: int):
	PlayerStats.WAVE_N = wave_n
	PlayerStats.HEALTH = anchor.get_node("Health").health
	PlayerStats.DAMAGE = rope.get_node("Hitbox").damage_amount
	PlayerStats.MAX_SPEED = player.get_node("SpeedLimit").max_speed
	PlayerStats.DASH_SPEED = player.get_node("RopeDashMovement").rope_dash_speed

func _on_hit():
	PlayerStats.HEALTH = anchor.get_node("Health").health
