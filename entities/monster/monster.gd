extends CharacterBody2D

## !!! AI handled by StateMachine !!!

@onready var state_machine: StateMachine = $StateMachine
@onready var target_group: String

@onready var animation := $Sprite

var target: CharacterBody2D

func _ready() -> void:
	target = get_tree().get_first_node_in_group(target_group)

func _physics_process(delta: float) -> void:
	move_and_slide()
	_handle_animations()

func _on_entity_follow_reached_dest(state: EntityFollow) -> void:
	state.switch_to("EntityAttack")

func _on_entity_follow_lost_sight(state: EntityFollow) -> void:
	state.switch_to("EntityWander")

func _on_entity_attack_out_of_range(state: EntityAttack) -> void:
	state.switch_to("EntityFollow")

func _handle_animations() -> void:
	if velocity.is_zero_approx():
		return
	
	if velocity.y > 0:
		animation.play("walk_down")
		return
	elif velocity.y < 0:
		animation.play("walk_up")
		return
	
	if velocity.x > 0:
		animation.flip_h = false
		animation.play("walk_right")
	else:
		animation.flip_h = true
		animation.play("walk_right")
