extends Control
class_name BuildCardUI

@onready var name_label: Label = $Panel/Name
@onready var image: TextureRect = $Panel/Image
@onready var description_label: RichTextLabel = $Panel/Description
@onready var rarity_label: Label = $Panel/Rarity

func show_card(build_card: BuildCard):
	name_label.text = build_card.name
	image.texture = build_card.image
	description_label.text = build_card.description
	rarity_label.text = build_card.get_rarity_as_string(build_card.rarity)
