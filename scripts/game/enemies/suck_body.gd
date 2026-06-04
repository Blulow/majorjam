extends Node2D

@export var enemy: Enemy
@export var strength: float = 100.0
@onready var body: CharacterBody2D = enemy.target

func _physics_process(delta: float) -> void:
	var dir: Vector2 = enemy.target.position.direction_to(enemy.position)
	enemy.target.get_node("BodyController").external_vel += dir * strength
