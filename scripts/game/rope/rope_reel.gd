extends Node2D

@export var rope: Rope

const REEL_LENGTH: float = 20.0
const MAX_LENGTH: float = 500.0
const MIN_LENGTH: float = 0.0

func _process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		if rope.max_length > MIN_LENGTH:
			rope.max_length -= REEL_LENGTH
	elif Input.is_action_pressed("down"):
		if rope.max_length < MAX_LENGTH:
			rope.max_length += REEL_LENGTH
