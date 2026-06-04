extends BuildEffect
class_name DashSpeedModifier

@export var modifier: float = 0.1

func on_added(context: CombatContext):
	if context.player:
		var rope_dash_movement: RopeDashMovement = context.player.get_node("RopeDashMovement")
		rope_dash_movement.rope_dash_speed *= modifier + 1
