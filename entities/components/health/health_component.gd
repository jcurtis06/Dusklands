extends Node
class_name HealthComponent

@export var max_health: float = 0
@onready var health = max_health

func deduct(amount: float) -> void:
	health -= amount
	
	if health <= 0:
		get_parent().queue_free()
