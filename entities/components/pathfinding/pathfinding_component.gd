extends NavigationAgent2D
class_name PathfindingComponent

@export var cb2d: CharacterBody2D
@export var speed: float

func _ready() -> void:
	set_physics_process(false)
	call_deferred("_setup")

func _setup() -> void:
	await get_tree().physics_frame
	set_physics_process(true)

func set_destination(dest: Vector2) -> void:
	target_position = dest

func _physics_process(delta: float) -> void:
	if is_navigation_finished() || !cb2d:
		return
	
	var current_pos: Vector2 = cb2d.global_position
	var next_point_pos: Vector2 = get_next_path_position()
	
	cb2d.velocity = current_pos.direction_to(next_point_pos) * speed
