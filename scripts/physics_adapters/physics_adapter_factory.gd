extends Node
class_name PhysicsAdapterFactory

static func create(body: Node2D) -> PhysicsAdapter:
	if body is CharacterBody2D:
		return CharacterAdapter.new(body)
	elif body is StaticBody2D:
		return StaticAdapter.new(body)
	elif body is RigidBody2D:
		return RigidBodyAdapter.new(body)
	
	return PhysicsAdapter.new()
