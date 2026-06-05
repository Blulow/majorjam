extends CharacterBody2D
class_name Enemy

@export var target: Node2D
@export var sprite: AnimatedSprite2D
@export var fly_towards_movement: FlyTowardsMovement
@export var audio: AudioStreamPlayer

func _on_health_died() -> void:
	if fly_towards_movement:
		fly_towards_movement.speed = 0.0
	audio.play()
	sprite.play("death")
	await sprite.animation_finished
	queue_free()
