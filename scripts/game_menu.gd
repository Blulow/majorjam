extends CanvasLayer

@export var wave_manager: WaveManager
@export var anchor: Anchor
@export var rope: Rope
@export var player: CharacterBody2D

@onready var wave_label: Label = $WaveLabel
@onready var health_label: Label = $HealthLabel
@onready var damage_label: Label = $DamageLabel

func _ready() -> void:
	wave_manager.wave_start.connect(_on_wave_start)

func _on_wave_start(wave_n: int):
	wave_label.text = "Wave: " + str(wave_n)
	health_label.text = "Health: " + str(anchor.get_node("Health").health)
	damage_label.text = "Damage: " + str(rope.get_node("Hitbox").damage_amount)
