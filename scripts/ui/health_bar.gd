extends TextureProgressBar

@export var health: Health

func _ready() -> void:
	health.hit.connect(_on_hit)

func _on_hit():
	value = health.health / health.max_health * 100
