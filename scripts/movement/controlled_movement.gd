extends Node
class_name ControlledMovement

@export var body: CharacterBody2D
@export var body_controller: BodyController

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var speed: float = SPEED

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump") and body.is_on_floor():
		body_controller.internal_vel.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")
	if direction:
		body_controller.internal_vel.x = direction * speed
	else:
		body_controller.internal_vel.x = move_toward(body_controller.internal_vel.x, 0, speed)
