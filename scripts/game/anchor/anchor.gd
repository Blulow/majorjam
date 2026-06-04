extends StaticBody2D
class_name Anchor

signal hit
signal died

func _on_health_died() -> void:
	if $RopeEnd:
		$RopeEnd.gravity_scale = 1
		$RopeEnd.reparent(get_node(".."))
	
	died.emit()
	queue_free()

func _on_health_hit() -> void:
	hit.emit()
