extends Node2D
class_name Rope

@export var obj1: Node2D
@export var obj2: Node2D
var max_length: float = 20.0

@export var build_applier: BuildApplier

func _on_hitbox_area_entered(area: Area2D) -> void:
	if not area.get_parent() is Enemy: return
	
	var context: CombatContext = CombatContext.new()
	context.enemy = area.get_parent()
	build_applier.on_hit(context)

func _process(delta: float) -> void:
	var context: CombatContext = CombatContext.new()
	context.delta = delta
	build_applier.on_tick(context)
