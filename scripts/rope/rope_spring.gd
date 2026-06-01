extends Node2D

@export var rope: Node2D
@export var spring_strength: float = 10
@export var damping : float = 2

func _physics_process(delta: float) -> void:
	if rope.obj1 == null or rope.obj2 == null: return
	apply_force(PhysicsAdapterFactory.create(rope.obj1), PhysicsAdapterFactory.create(rope.obj2), delta)

func apply_force(a: PhysicsAdapter, b: PhysicsAdapter, delta: float) -> void:
	var pa = a.get_position()
	var pb = b.get_position()
	
	var dir = pa.direction_to(pb)
	var dist = pa.distance_to(pb)
	var stretch = dist - rope.max_length
	
	if stretch <= 0: return
	
	var va = a.get_velocity()
	var vb = b.get_velocity()
	var vel_dot = va.dot(dir)
	
	var spring = stretch * spring_strength
	var damp = -damping * vel_dot
	var force = dir * (spring + damp)
	a.add_velocity(force * delta)
