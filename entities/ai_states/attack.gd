extends State
class_name EntityAttack

signal out_of_range(state: EntityAttack)

@export var cb2d: CharacterBody2D
@export var target_group: String
@export var attack_component: AttackComponent
@export var attack_cooldown: float = 5.0
@export var attack_range: float = 200.0

@onready var target: Node2D = get_tree().get_first_node_in_group(target_group)

var cooldown: float

func update(delta: float) -> void:
	if target != null:
		attack_component.look_at(target.global_position)
		
		var dist_to_target = cb2d.global_position.distance_to(target.global_position)
		
		if dist_to_target > attack_range:
			out_of_range.emit(self)
	else:
		reset()
	
	if cooldown > 0:
		cb2d.velocity = Vector2.ZERO
		cooldown -= delta
	else:
		attack_component.attack(1)
		cooldown = attack_cooldown
