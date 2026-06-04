extends VisibleOnScreenNotifier2D

@export var death_screen: Control
@export var audio: AudioStreamPlayer
@export var anchor: Anchor

func _ready() -> void:
	death_screen.visible = false
	anchor.died.connect(_on_anchor_died)

func _on_screen_exited() -> void:
	if anchor: return
	
	show_death_screen()

func _on_anchor_died() -> void:
	if not is_on_screen():
		show_death_screen()

func show_death_screen() -> void:
	audio.stop()
	
	await get_tree().create_timer(0.5).timeout
	get_tree().paused = true
	death_screen.get_node("Panel/WaveLabel2").text = str(PlayerStats.WAVE_N - 1)
	
	var anim: AnimationPlayer = death_screen.get_node("AnimationPlayer")
	
	death_screen.visible = true
	anim.play("death_screen")
