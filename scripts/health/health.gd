extends Node2D
class_name Health

signal died
signal hit

@export var max_health: float = 10.0
@export var invincible: bool = false
var health: float = max_health

func damage(amount: float) -> void:
	if invincible: return
	health -= amount
	hit.emit()
	
	if health <= 0:
		health = 0
		died.emit()
