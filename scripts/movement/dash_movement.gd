extends Node2D
class_name DashMovement

@export var body_controller: BodyController

const DASH_SPEED: float = 5.0
const DASH_TIME: float = 0.3

var timer: float = 0.0
var dashing: bool = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("dash"):
		body_controller.external_vel *= DASH_SPEED
		dashing = true
	
	if dashing:
		timer += delta
		if timer >= DASH_TIME:
			body_controller.external_vel /= DASH_SPEED
			dashing = false
			timer = 0.0
