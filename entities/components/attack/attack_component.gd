extends RayCast2D
class_name AttackComponent

@export var attack_damage: int = 0
@export var look_at_mouse = false

@onready var slash := $SlashEffect

func _ready() -> void:
	set_process_unhandled_input(look_at_mouse)

func attack(amount: float) -> void:
	slash.visible = true
	slash.play("default")
	
	if !is_colliding():
		return
	
	if get_collider() is HitboxComponent:
		var hitbox = get_collider() as HitboxComponent
		hitbox.damage(attack_damage, global_position)
	
	if get_collider() is BlockGrid:
		var bg = get_collider() as BlockGrid
		var pos = get_collision_point() - get_collision_normal()
		bg.damage_block(pos, attack_damage)

func _unhandled_input(event: InputEvent) -> void:
	look_at(get_global_mouse_position())

func _on_slash_effect_animation_finished() -> void:
	slash.visible = false
