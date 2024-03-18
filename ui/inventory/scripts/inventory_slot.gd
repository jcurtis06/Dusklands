extends Panel
class_name InventorySlot

@onready var display := $Display
@onready var count := $Count

var current_item: ItemStack

func update_item(new_item: ItemStack) -> void:
	if new_item == null:
		count.visible = false
		return
	
	current_item = new_item
	display.texture = new_item.texture
	count.text = str(new_item.count)
	count.visible = true
