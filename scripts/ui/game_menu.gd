extends CanvasLayer

@export var wave_manager: WaveManager
@export var anchor: Anchor
@export var rope: Rope
@export var player: CharacterBody2D

@onready var health_label: Label = $Stats/HealthLabel
@onready var damage_label: Label = $Stats/DamageLabel
@onready var max_speed_label: Label = $Stats/MaxSpeedLabel
@onready var dash_speed_label: Label = $Stats/DashSpeedLabel
@onready var speed_label: Label = $Stats/SpeedLabel
@onready var lightning_count_label: Label = $Stats/LightningCountLabel
@onready var wave_label: Label = $WaveStats/WaveLabel
@onready var time_label: Label = $WaveStats/TimeLabel

func _ready() -> void:
	if wave_manager:
		wave_manager.wave_start.connect(_on_wave_start)
		anchor.hit.connect(_on_hit)
	else:
		wave_label.text = "Wave: 0"
		time_label.text = "Time Left: 0"
		health_label.text = "Health: " + str(anchor.get_node("Health").health)
		damage_label.text = "Damage: " + str(rope.get_node("Hitbox").damage_amount)
		max_speed_label.text = "Max Speed: " + str(player.get_node("SpeedLimit").max_speed)
		dash_speed_label.text = "Dash Speed: " + str(player.get_node("RopeDashMovement").rope_dash_speed)
		lightning_count_label.text = "Lightning Count: " + str(PlayerStats.LIGHTNING_COUNT)

func _on_wave_start(wave_n: int):
	wave_label.text = "Wave: " + str(PlayerStats.WAVE_N)
	health_label.text = "Health: " + str(PlayerStats.HEALTH)
	damage_label.text = "Damage: " + str(PlayerStats.DAMAGE)
	max_speed_label.text = "Max Speed: " + str(PlayerStats.MAX_SPEED)
	dash_speed_label.text = "Dash Speed: " + str(PlayerStats.DASH_SPEED)
	lightning_count_label.text = "Lightning Count: " + str(PlayerStats.LIGHTNING_COUNT)

func _on_hit():
	health_label.text = "Health: " + str(PlayerStats.HEALTH)

func _process(delta: float) -> void:
	speed_label.text = "Speed: " + str(int(player.velocity.length()))
	if wave_manager:
		time_label.text = "Time Left: " + str(int(wave_manager.duration_timer))
