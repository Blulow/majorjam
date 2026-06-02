extends Node2D

@export var body_controller: BodyController
@export var min_vel: float
@export var max_vel: float

func _physics_process(delta: float) -> void:
	body_controller.body.velocity = body_controller.body.velocity.clampf(min_vel, max_vel)
