extends Control
class_name BuildCardUI

@onready var name_label: Label = $Panel/Name
@onready var image: TextureRect = $Panel/Image
@onready var description_label: RichTextLabel = $Panel/Description
@onready var rarity_label: Label = $Panel/Rarity
@onready var panel: Panel = $Panel
var build_card: BuildCard

signal selected_build(build: Build)

var rarity_colors: Dictionary[BuildCard.BuildRarity, Color] = {
	BuildCard.BuildRarity.COMMON: Color(1, 1, 1),
	BuildCard.BuildRarity.UNCOMMON: Color(0, 1, 0),
	BuildCard.BuildRarity.RARE: Color(0, 0, 1),
	BuildCard.BuildRarity.EPIC: Color(1, 0, 1),
	BuildCard.BuildRarity.LEGENDARY: Color(1, 1, 0),
}

func show_card(_build_card: BuildCard):
	build_card = _build_card
	name_label.text = build_card.name
	image.texture = build_card.image
	description_label.text = build_card.description
	rarity_label.text = build_card.get_rarity_as_string(build_card.rarity)
	panel.self_modulate = rarity_colors[build_card.rarity]

func _on_gui_input(event: InputEvent) -> void:
	if not event is InputEventMouseButton: return
	
	if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var build: Build = build_card.build
		selected_build.emit(build)
