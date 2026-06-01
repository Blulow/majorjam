extends Node2D

@export var rope: Line2D
@export var obj1: Node2D
@export var obj2: Node2D

func _process(delta: float) -> void:
	if obj1 == null or obj2 == null: return
	
	var p1 = to_local(obj1.global_position)
	var p2 = to_local(obj2.global_position)
	
	rope.points = [p1, p2]
	
	rope.length = p1.distance_to(p2)

func set_rope_attach(_obj1, _obj2):
	obj1 = _obj1
	obj2 = _obj2
