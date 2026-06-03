extends Control
class_name BuildBuilder

@export var build_card_scene: PackedScene

@onready var container: HBoxContainer = $HBoxContainer

func show_cards(build_cards: Array[BuildCard]):
	for i: BuildCard in build_cards:
		var build_card: Control = build_card_scene.instantiate()
		container.add_child(build_card)
		build_card.show_card(i)
