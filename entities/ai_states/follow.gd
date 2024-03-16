extends State
class_name EntityFollow

signal reached_dest(state: EntityFollow)
signal lost_sight(state: EntityFollow)

@export var cb2d: CharacterBody2D
@export var pathfinding: PathfindingComponent

@export var target_group: String
@export var speed: float
@export var min_dist: float = 200.0
@export var max_dist: float = 500.0

@onready var target_node: Node2D = get_tree().get_first_node_in_group(target_group)

func physics_update(delta: float) -> void:
	if target_node == null:
		reset()
		return
	
	var direction = target_node.global_position - cb2d.global_position
	
	if direction.length() > max_dist:
		lost_sight.emit(self)
		cb2d.velocity = Vector2.ZERO
		return
	
	if direction.length() > min_dist:
		if pathfinding:
			pathfinding.set_destination(target_node.global_position)
		else:
			cb2d.velocity = direction.normalized() * speed
	else:
		reached_dest.emit(self)
		cb2d.velocity = Vector2.ZERO
