extends ParallaxBackground

@export var max_offset_length: float = 50.0
@export var smooth_speed: float = 8.0

func _process(delta: float) -> void:
	var viewport_size: Vector2 = get_viewport().get_visible_rect().size
	var mouse_pos: Vector2 = get_viewport().get_mouse_position()
	
	var relative_mouse_pos: Vector2 = Vector2(
		(mouse_pos.x - (viewport_size.x / 2.0)) / (viewport_size.x / 2.0),
		(mouse_pos.y - (viewport_size.y / 2.0)) / (viewport_size.y / 2.0)
	)
	
	var target_offset: Vector2 = relative_mouse_pos * max_offset_length
	
	scroll_base_offset = scroll_base_offset.lerp(target_offset, smooth_speed * delta)
