extends Resource
class_name BlockData

@export_category("Item Data")
@export var item_texture: Texture
@export var count: int = 1
@export var name: String = ""

@export_category("Block Data")
@export var is_block: bool = false
@export var atlas_id: int = 0
@export var atlas_position: Vector2i = Vector2i.ZERO
@export var health: float = 0
#@export var item_stack: ItemStack
