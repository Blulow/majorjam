extends Area2D
class_name Hurtbox

@export var health: Health
@export var hit_cooldown: float = 1.0

var damage_amount: float
var hit: bool = false
@onready var timer: float = hit_cooldown

func _process(delta: float) -> void:
	if timer < hit_cooldown:
		timer += delta
	else:
		if not hit: return
		health.damage(damage_amount)
		timer = 0.0

func _on_area_entered(area: Area2D) -> void:
	if area is Hitbox:
		damage_amount = area.damage_amount
		hit = true

func _on_area_exited(area: Area2D) -> void:
	if area is Hitbox:
		hit = false
