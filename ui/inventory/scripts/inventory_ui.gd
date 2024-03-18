extends GridContainer
class_name InventoryUI

@export var showing: Inventory

func _ready() -> void:
	if showing:
		visible = true
		update_view()
	else:
		visible = false

func _process(delta: float) -> void:
	if showing.ui_refresh:
		update_view()
		showing.ui_refresh = false

func open(inventory: Inventory) -> void:
	showing = inventory
	update_view()
	set_process(true)

func update_view() -> void:
	if showing == null:
		return
	
	for i in range(min(showing.slots.size(), get_child_count())):
		var ui_slot = get_child(i) as InventorySlot
		var item_stack = showing.slots[i]
		ui_slot.update_item(item_stack)
