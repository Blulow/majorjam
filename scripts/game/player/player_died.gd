extends VisibleOnScreenNotifier2D

@export var death_screen: Control
@export var anchor: Anchor

func _ready() -> void:
	death_screen.visible = false

func _on_screen_exited() -> void:
	if anchor: return
	
	await get_tree().create_timer(0.5).timeout
	get_tree().paused = true
	death_screen.get_node("Panel/WaveLabel2").text = str(PlayerStats.WAVE_N - 1)
	
	var anim: AnimationPlayer = death_screen.get_node("AnimationPlayer")
	anim.stop()
	anim.seek(0.0)
	
	death_screen.visible = true
	anim.play("death_screen")
