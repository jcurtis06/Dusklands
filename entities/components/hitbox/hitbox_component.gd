extends Area2D
class_name HitboxComponent

@export var health_component: HealthComponent

func damage(amount: float) -> void:
	if health_component:
		health_component.deduct(amount)
