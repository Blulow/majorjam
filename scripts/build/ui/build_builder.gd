extends Control
class_name BuildBuilder

@export var build_card_scene: PackedScene

@onready var container: HBoxContainer = $HBoxContainer

signal selected_build(build: Build)

func show_cards(build_cards: Array[BuildCard]) -> void:
	visible = true
	
	for i: BuildCard in build_cards:
		var build_card: Control = build_card_scene.instantiate()
		container.add_child(build_card)
		build_card.selected_build.connect(
			func(build: Build) -> void: selected_build.emit(build)
		)
		build_card.show_card(i)

func close_cards() -> void:
	for child in container.get_children():
		child.queue_free()
	visible = false
