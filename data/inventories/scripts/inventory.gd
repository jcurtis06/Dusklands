extends Resource
class_name Inventory

@export var slots: Array[BlockData] = []

var ui_refresh = false

func add_item(item: BlockData) -> void:
	for slot in slots:
		if slot == null:
			continue
		
		if slot.name == item.name:
			slot.count += 1
			ui_refresh = true
			return
	
	for i in range(slots.size()):
		if slots[i] == null:
			slots[i] = item
			ui_refresh = true
			return

func remove_item(item: BlockData) -> void:
	item.count -= 1
	
	if item.count <= 0:
		var i = slots.find(item)
		
		if i != -1:
			slots[i] = null
			ui_refresh = true
