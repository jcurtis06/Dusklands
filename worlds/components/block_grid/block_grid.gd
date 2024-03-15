extends TileMap
class_name BlockGrid

## DATA GRID
## - Key: Vector2i
## - Value: BlockData
var data_grid = {}

func set_block_at(pos: Vector2, block: BlockData) -> void:
	var map_pos = local_to_map(pos)
	set_cell(0, map_pos, block.atlas_id, block.atlas_position)
	
	data_grid[map_pos] = block.duplicate()

func damage_block(pos: Vector2, amount: float) -> void:
	var data = get_block_data(pos)
	var new_health = data.health - amount
	
	if new_health <= 0:
		delete_cell(pos)
		return
	
	data.health = new_health

func get_position_snapped(in_pos: Vector2) -> Vector2:
	var map = local_to_map(in_pos)
	var final = map_to_local(map)
	return final

func get_block_data(pos: Vector2) -> BlockData:
	var map_pos = local_to_map(pos)
	return data_grid[map_pos]

func clear_block_data(pos: Vector2) -> void:
	var map_pos = local_to_map(pos)
	data_grid.erase(map_pos)

func delete_cell(pos: Vector2, del_data = true) -> void:
	var map_pos = local_to_map(pos)
	set_cell(0, map_pos)
	
	if del_data:
		clear_block_data(pos)