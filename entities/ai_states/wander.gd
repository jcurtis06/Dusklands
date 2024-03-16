extends State
class_name EntityWander

@export var cb2d: CharacterBody2D
@export var pathfinding: PathfindingComponent
@export var speed: float

@export var min_radius: float = 100.0
@export var max_radius: float = 250.0

@export var follow_state: EntityFollow

var current_dest: Vector2
var move_direction: Vector2
var wander_radius: float

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_radius = randf_range(min_radius, max_radius)
	current_dest = (wander_radius * move_direction) + cb2d.global_position
	
	if pathfinding:
			pathfinding.set_destination(current_dest)

func enter():
	if pathfinding:
		pathfinding.speed = speed
	
	randomize_wander()

func update(delta: float) -> void:
	if follow_state:
		check_follow()
	
	if cb2d.global_position.distance_to(current_dest) < 10:
		randomize_wander()

func physics_update(delta: float) -> void:
	if cb2d:
		return
	
	# SIMPLE PATHFINDING
	cb2d.velocity = move_direction * speed

func check_follow():
	if follow_state.target_node == null:
		return
	
	var distance = cb2d.global_position.distance_to(follow_state.target_node.global_position)
	
	if distance < follow_state.max_dist && distance > follow_state.min_dist:
		switch_to(follow_state.name)
