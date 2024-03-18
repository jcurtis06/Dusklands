extends Resource
class_name BlockData

@export_category("Tile Location")
@export var atlas_id: int = 0
@export var atlas_position: Vector2i = Vector2i.ZERO

@export_category("Block Data")
@export var health: float = 0
@export var item_stack: ItemStack
