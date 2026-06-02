extends BuildEffect
class_name HealthModifier

@export var modifier: float = 0.1

func on_added(context: CombatContext):
	var health: Health = context.anchor.get_node("Health")
	health.health *= modifier + 1
