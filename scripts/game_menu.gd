extends CanvasLayer

@export var wave_manager: WaveManager
@export var anchor: Anchor
@export var rope: Rope
@export var player: CharacterBody2D

@onready var wave_label: Label = $WaveLabel
@onready var health_label: Label = $Stats/HealthLabel
@onready var damage_label: Label = $Stats/DamageLabel
@onready var max_speed_label: Label = $Stats/MaxSpeedLabel
@onready var dash_speed_label: Label = $Stats/DashSpeedLabel
@onready var speed_label: Label = $Stats/SpeedLabel

func _ready() -> void:
	wave_manager.wave_start.connect(_on_wave_start)
	anchor.hit.connect(_on_hit)

func _on_wave_start(wave_n: int):
	wave_label.text = "Wave: " + str(wave_n)
	health_label.text = "Health: " + str(anchor.get_node("Health").health)
	damage_label.text = "Damage: " + str(rope.get_node("Hitbox").damage_amount)
	max_speed_label.text = "Max Speed: " + str(player.get_node("SpeedLimit").max_speed)
	dash_speed_label.text = "Dash Speed: " + str(player.get_node("RopeDashMovement").rope_dash_speed)

func _on_hit():
	health_label.text = "Health: " + str(anchor.get_node("Health").health)

func _process(delta: float) -> void:
	speed_label.text = "Speed: " + str(player.velocity.length())
