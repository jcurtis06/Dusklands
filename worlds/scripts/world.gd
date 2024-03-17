extends Node2D
class_name World

@export var block_grid: BlockGrid
@export var player: CharacterBody2D
@export var safety_radius: float
@export var max_radius: float
@export var spawn_rate: int = 2

@onready var monster_tscn: PackedScene = preload("res://entities/monster/monster.tscn")

func _on_day_night_cycle_on_night_time() -> void:
	_spawn_hostiles()

func _spawn_hostiles():
	for i in range(0, spawn_rate):
		var pos = Vector2(
			randf_range(
				player.global_position.x + safety_radius, 
				player.global_position.x + max_radius
			),
			randf_range(
				player.global_position.y + safety_radius, 
				player.global_position.y + max_radius
			)
		)
		
		var monster = monster_tscn.instantiate() # TODO: More flexibility
		monster.global_position = pos
		add_child(monster)
