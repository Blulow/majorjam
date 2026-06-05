extends AudioStreamPlayer

@export var rope_dash_movement: RopeDashMovement

func _ready() -> void:
	rope_dash_movement.dash.connect(func(): play())
