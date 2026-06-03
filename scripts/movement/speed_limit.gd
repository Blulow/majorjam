extends Node2D
class_name SpeedLimit

@export var max_speed: float = 1000.0
@export var body_controller: BodyController

func _physics_process(delta: float) -> void:
	var vel: Vector2 = body_controller.total_vel
	if vel.length() > max_speed:
		body_controller.modify_vel(vel.limit_length(max_speed))
