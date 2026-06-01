extends Node2D

@export var rope: Node2D
@export var spring_strength: float = 10
@export var damping : float = 10

func _physics_process(delta: float) -> void:
	if rope.obj1 == null or rope.obj2 == null: return
	apply_force(PhysicsAdapterFactory.create(rope.obj1), PhysicsAdapterFactory.create(rope.obj2), delta)

func apply_force(a: PhysicsAdapter, b: PhysicsAdapter, delta: float) -> void:
	var pa = a.get_position()
	var pb = b.get_position()
	
	var delta_vec = pa - pb
	var dist = delta_vec.length()
	
	if dist <= rope.max_length or dist == 0:
		return
	
	var dir = delta_vec / dist
	var stretch = dist - rope.max_length
	var correction = dir * stretch * 0.5
	
	var va = a.get_velocity()
	var vb = b.get_velocity()
	var rel_vel = (va - vb).dot(dir)
	
	if rel_vel > 0:
		var damp = dir * rel_vel * 1.8
		a.set_velocity(va - damp)
		b.set_velocity(vb + damp)
	
	a.set_position(pa - correction)
	b.set_position(pb + correction)
