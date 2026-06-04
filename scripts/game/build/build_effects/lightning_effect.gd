extends BuildEffect
class_name LightningEffect

@export var count: int
var lightning_scene: PackedScene = preload("res://scenes/attack_objects/lightning.tscn")

const COOLDOWN: float = 1.0
var timer: float = COOLDOWN

var can_hit: bool = true

func on_added(context: CombatContext):
	PlayerStats.LIGHTNING_COUNT += count

func on_hit(context: CombatContext):
	if not can_hit: return
	
	var lightning: Lightning = lightning_scene.instantiate()
	context.arena.add_child(lightning)
	lightning.get_node("Hitbox").damage_amount = context.rope.get_node("Hitbox").damage_amount
	lightning.attack(context.enemy, PlayerStats.LIGHTNING_COUNT, context.arena)
	can_hit = false

func on_tick(context: CombatContext):
	if can_hit: return
	
	if timer < COOLDOWN:
		timer += context.delta
	else:
		can_hit = true
		timer = 0.0
