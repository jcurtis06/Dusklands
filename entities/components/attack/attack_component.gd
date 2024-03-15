extends RayCast2D
class_name AttackComponent

@export var attack_damage: int = 0
@export var look_at_mouse = false

func _ready() -> void:
	set_process_unhandled_input(look_at_mouse)

func attack(amount: float) -> void:
	if !is_colliding():
		return
	
	if get_collider() is HitboxComponent:
		var hitbox = get_collider() as HitboxComponent
		hitbox.damage(attack_damage)

func _unhandled_input(event: InputEvent) -> void:
	look_at(get_global_mouse_position())
