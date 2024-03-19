extends Node
class_name WorldGen

@export var block_grid: BlockGrid
@export var noise_height_texture: NoiseTexture2D
@export var width: int = 100
@export var height: int = 100

@export_category("Blocks")
@export var land: BlockData
@export var cliffs: BlockData

var noise: Noise

func _ready() -> void:
	noise = noise_height_texture.noise
	generate_world()

func generate_world() -> void:
	for x in range(width):
		for y in range(height):
			var noise_val = noise.get_noise_2d(x, y)
			var pos = Vector2i(x, y)
			
			if noise_val >= 0.0:
				block_grid.set_block_at_map(pos, land, 0)
			if noise_val >= 0.4:
				print("placed cliffs")
				block_grid.set_block_at_map(pos, cliffs)
