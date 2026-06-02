extends Area2D
class_name Hurtbox

@export var health: Health
@export var hit_cooldown: float = 1.0

var hitboxes: Array[Hitbox] = []
var damage_amount: float
var hit: bool = false
@onready var timer: float = hit_cooldown

func _process(delta: float) -> void:
	if timer <= hit_cooldown:
		timer += delta
	else:
		if hitboxes.is_empty(): return
		
		for i in hitboxes:
			health.damage(i.damage_amount)
		timer = 0.0

func _on_area_entered(area: Area2D) -> void:
	if area is Hitbox:
		hitboxes.append(area)

func _on_area_exited(area: Area2D) -> void:
	if area is Hitbox:
		hitboxes.erase(area)
