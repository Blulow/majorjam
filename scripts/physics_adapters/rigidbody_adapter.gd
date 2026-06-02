extends PhysicsAdapter
class_name RigidBodyAdapter

var body: RigidBody2D

func _init(b) -> void: body = b

func get_position() -> Vector2: return body.global_position
func set_position(p: Vector2) -> void: body.global_position = p
func get_velocity() -> Vector2: return body.linear_velocity
func set_velocity(v: Vector2) -> void: body.linear_velocity = v
