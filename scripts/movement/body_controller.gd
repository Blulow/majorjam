extends Node2D
class_name BodyController

@export var body: CharacterBody2D
@export var gravity_on: bool = true
@export var max_velocity: float = 1000.0

const GRAVITY = 980.0

var internal_vel: Vector2
var external_vel: Vector2

func _physics_process(delta: float) -> void:
	if not body.is_on_floor() and gravity_on:
		external_vel.y += GRAVITY * delta
	
	var total_vel: Vector2 = internal_vel + external_vel
	body.velocity = total_vel
	body.move_and_slide()
