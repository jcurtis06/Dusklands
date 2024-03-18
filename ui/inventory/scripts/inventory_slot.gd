extends Panel
class_name InventorySlot

@onready var display := $Display
@onready var count := $Count

var current_item: BlockData

func update_item(new_item: BlockData) -> void:
	if new_item == null:
		count.visible = false
		display.visible = false
		return
	
	current_item = new_item
	display.texture = new_item.item_texture
	count.text = str(new_item.count)
	count.visible = true
	display.visible = true
