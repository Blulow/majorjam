extends Node2D

@export var sprite: AnimatedSprite2D
@export var body_controller: BodyController
@export var rope_dash_movement: RopeDashMovement

@export var idle_name: String = "idle"
@export var run_name: String = "run"
@export var dash_name: String = "dash"

func _process(delta: float) -> void:
	if rope_dash_movement.dashing:
		sprite.animation = dash_name
	elif body_controller.internal_vel != Vector2.ZERO:
		sprite.animation = run_name
	else:
		sprite.animation = idle_name
	
	if body_controller.internal_vel.x != 0:
		if body_controller.internal_vel.x < 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
