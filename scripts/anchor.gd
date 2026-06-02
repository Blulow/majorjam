extends StaticBody2D

func _on_health_died() -> void:
	if $RopeEnd:
		$RopeEnd.gravity_scale = 1
		$RopeEnd.reparent(get_node(".."))
	
	queue_free()
