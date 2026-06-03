extends Control
class_name BuildCardUI

@onready var name_label: Label = $Panel/Name
@onready var image: TextureRect = $Panel/Image
@onready var description_label: RichTextLabel = $Panel/Description
@onready var rarity_label: Label = $Panel/Rarity
var build_card: BuildCard

signal selected_build(build: Build)

func show_card(_build_card: BuildCard):
	build_card = _build_card
	name_label.text = build_card.name
	image.texture = build_card.image
	description_label.text = build_card.description
	rarity_label.text = build_card.get_rarity_as_string(build_card.rarity)

func _on_gui_input(event: InputEvent) -> void:
	if not event is InputEventMouseButton: return
	
	if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var build: Build = build_card.build
		selected_build.emit(build)
