extends BuildEffect
class_name AttackModifier

@export var modifier: float = 0.1

func on_added(context: CombatContext):
	if context.rope:
		var hitbox: Hitbox = context.rope.get_node("Hitbox")
		hitbox.damage_amount *= modifier + 1
