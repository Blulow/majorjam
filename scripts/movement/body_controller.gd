extends Node2D
class_name BodyController

@export var body: CharacterBody2D

const GRAVITY = 980.0

var internal_vel: Vector2
var external_vel: Vector2

func _physics_process(delta: float) -> void:
	if not body.is_on_floor():
		external_vel.y += GRAVITY * delta
	
	body.velocity = internal_vel + external_vel
	body.move_and_slide()
