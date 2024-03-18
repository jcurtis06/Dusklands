extends Resource
class_name ItemStack

@export var texture: Texture
@export var count: int = 1
@export var name: String = ""
@export var material: ItemMaterial

enum ItemMaterial {
	WOOD,
	STONE
}
