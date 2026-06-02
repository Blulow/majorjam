extends Node2D
class_name Health

signal died

@export var health: float = 10.0
@export var invincible: bool = false

func damage(amount: float) -> void:
	if invincible: return
	health -= amount
	
	if health <= 0:
		health = 0
		died.emit()
