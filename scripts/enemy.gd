extends CharacterBody2D
class_name Enemy

@export var target: Node2D

func _on_health_died() -> void:
	queue_free()
