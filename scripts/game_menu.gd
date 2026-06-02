extends CanvasLayer

@export var wave_manager: WaveManager

@onready var wave_label: Label = $WaveLabel

func _ready() -> void:
	wave_manager.wave_start.connect(_on_wave_start)

func _on_wave_start(wave_n: int):
	wave_label.text = "Wave: " + str(wave_n)
