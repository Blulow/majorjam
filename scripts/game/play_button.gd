extends TextureButton

func _on_button_down() -> void:
	create_tween().tween_property(self, "scale", -Vector2.ONE * 0.5, 0.1).as_relative().set_trans(Tween.TRANS_BOUNCE)

func _on_button_up() -> void:
	create_tween().tween_property(self, "scale", Vector2.ONE * 0.5, 0.1).as_relative().set_trans(Tween.TRANS_BOUNCE)
	await get_tree().create_timer(0.1).timeout
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")
