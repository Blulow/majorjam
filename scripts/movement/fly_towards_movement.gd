extends Node2D
class_name FlyTowardsMovement

@export var body: Enemy
@export var body_controller: BodyController

@export var SPEED = 300.0

var speed: float = SPEED
var dir: Vector2
var target: Node2D

func _ready() -> void:
	target = body.target
	dir = body.global_position.direction_to(target.global_position)

func _physics_process(delta: float) -> void:
	body_controller.internal_vel = dir * speed
