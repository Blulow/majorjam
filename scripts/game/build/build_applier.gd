extends Node2D
class_name BuildApplier

@export var build: Build
@export var player: CharacterBody2D
@export var rope: Rope
@export var anchor: Anchor

func apply_build(_build: Build):
	build = _build
	for effect: BuildEffect in build.effects:
		var context: CombatContext = CombatContext.new()
		if player and rope and anchor:
			context.player = player
			context.rope = rope
			context.anchor = anchor
		effect.on_added(context)

func on_hit(context: CombatContext):
	if not build: return
	for effect: BuildEffect in build.effects:
		effect.on_hit(context)
		
func on_tick(context: CombatContext):
	if not build: return
	for effect: BuildEffect in build.effects:
		effect.on_tick(context)
