extends BuildEffect
class_name MaxSpeedModifier

@export var modifier: float = 0.1

func on_added(context: CombatContext):
	var speed_limit: SpeedLimit = context.player.get_node("SpeedLimit")
	speed_limit.max_speed *= modifier + 1
