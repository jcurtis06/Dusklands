extends Resource
class_name Inventory

@export var slots: Array[ItemStack] = []

var ui_refresh = false

func add_item(item: ItemStack) -> void:
	for slot in slots:
		if slot == null:
			continue
		
		if slot == item:
			slot.count += 1
			ui_refresh = true
			return
	
	for i in range(slots.size()):
		if slots[i] == null:
			slots[i] = item
			ui_refresh = true
			return
