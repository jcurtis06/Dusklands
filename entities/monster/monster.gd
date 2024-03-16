extends CharacterBody2D

## !!! AI handled by StateMachine !!!

@onready var state_machine: StateMachine = $StateMachine
@onready var target_group: String

var target: CharacterBody2D

func _ready() -> void:
	target = get_tree().get_first_node_in_group(target_group)

func _physics_process(delta: float) -> void:
	move_and_slide()

func _on_entity_follow_reached_dest(state: EntityFollow) -> void:
	state.switch_to("EntityAttack")

func _on_entity_follow_lost_sight(state: EntityFollow) -> void:
	state.switch_to("EntityWander")

func _on_entity_attack_out_of_range(state: EntityAttack) -> void:
	state.switch_to("EntityFollow")
