extends Node2D
class_name World

@export var block_grid: BlockGrid

@onready var monster: PackedScene = preload("res://entities/monster/monster.tscn")

func _on_day_night_cycle_on_night_time() -> void:
	print("night hath fallen")
	add_child(monster.instantiate())
