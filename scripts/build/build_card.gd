extends Resource
class_name BuildCard

@export var name: String
@export var description: String
@export var image: Texture2D
@export var rarity: BuildRarity
@export var build: Build

enum BuildRarity {
	COMMON,
	UNCOMMON,
	RARE,
	EPIC,
	LEGENDARY
}

func get_rarity_as_string(_rarity: BuildRarity):
	match _rarity:
		BuildRarity.COMMON:
			return "Common"
		BuildRarity.UNCOMMON:
			return "Uncommon"
		BuildRarity.RARE:
			return "Rare"
		BuildRarity.EPIC:
			return "Epic"
		BuildRarity.LEGENDARY:
			return "Legendary"
