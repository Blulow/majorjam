extends Node2D

@export var hitbox: Hitbox
@export var audio: AudioStreamPlayer

func _ready() -> void:
	hitbox.body_entered.connect(_on_hit)

func _on_hit(body: Node2D) -> void:
	audio.play()
	var vel: Vector2 = body.get_node("BodyController").external_vel
	body.get_node("BodyController").external_vel = vel.limit_length(200.0)
