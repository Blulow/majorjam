extends Node2D
class_name BuildManager

@export var wave_manager: WaveManager
@export var build_builder: BuildBuilder
@export var registered_build_cards: Array[BuildCard] = []
@export var card_count: int = 2

func _ready() -> void:
	wave_manager.wave_stop.connect(_on_wave_stop)

func _on_wave_stop():
	var build_cards: Array[BuildCard] = get_random_build_cards(registered_build_cards, card_count)
	build_builder.show_cards(build_cards)

func get_random_build_cards(build_cards: Array[BuildCard], count: int) -> Array[BuildCard]:
	build_cards.shuffle()
	var result_cards: Array[BuildCard]
	
	for i in count:
		result_cards.append(build_cards[i])
	return result_cards
