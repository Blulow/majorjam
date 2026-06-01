extends Node

@export var body: CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 980.0

func _physics_process(delta: float) -> void:
	if not body.is_on_floor():
		body.velocity.y += GRAVITY * delta

	if Input.is_action_just_pressed("jump") and body.is_on_floor():
		body.velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")
	if direction:
		body.velocity.x = direction * SPEED
	else:
		body.velocity.x = move_toward(body.velocity.x, 0, SPEED)

	body.move_and_slide()
