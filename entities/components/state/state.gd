extends Node
class_name State

signal transitioned(state: State, new_state_name: String)
signal reset_state(state: State)

func enter():
	pass

func exit():
	pass

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func switch_to(new_state: String) -> void:
	transitioned.emit(self, new_state)

func reset() -> void:
	reset_state.emit(self)
