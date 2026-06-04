extends Line2D

const DISAPPEAR_TIME: float = 1.0

var timer: float = 0.0

func _process(delta: float) -> void:
	if timer < DISAPPEAR_TIME:
		modulate.a = 1 - timer / DISAPPEAR_TIME
		timer += delta
	else:
		queue_free()
