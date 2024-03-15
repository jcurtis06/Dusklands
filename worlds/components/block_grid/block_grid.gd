extends TileMap
class_name BlockGrid

func set_block_at(pos: Vector2, block: BlockData) -> void:
	var map_pos = local_to_map(pos)
	set_cell(0, map_pos, block.atlas_id, block.atlas_position)

func get_position_snapped(in_pos: Vector2) -> Vector2:
	var map = local_to_map(in_pos)
	var final = map_to_local(map)
	return final
