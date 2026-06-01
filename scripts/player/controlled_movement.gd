extends Node

@export var body: CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 980.0

var internal_vel: Vector2
var external_vel: Vector2

func _physics_process(delta: float) -> void:
	if not body.is_on_floor():
		internal_vel.y += GRAVITY * delta

	if Input.is_action_just_pressed("jump") and body.is_on_floor():
		internal_vel.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")
	if direction:
		internal_vel.x = direction * SPEED
	else:
		internal_vel.x = move_toward(internal_vel.x, 0, SPEED)

	body.velocity = internal_vel + external_vel
	body.move_and_slide()
