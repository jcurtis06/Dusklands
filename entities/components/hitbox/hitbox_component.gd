extends Area2D
class_name HitboxComponent

@export var cb2d: CharacterBody2D
@export var health_component: HealthComponent
@export var flashable_sprite: AnimatedSprite2D

func damage(amount: float, from: Vector2) -> void:
	if health_component:
		health_component.deduct(amount)
		print(get_parent().name + " got hit!")
	
	if cb2d:
		# KNOCKBACK
		var knockback_direction = (cb2d.global_position - from).normalized()
		apply_knockback(knockback_direction)
	
	if flashable_sprite:
		var shader: ShaderMaterial = flashable_sprite.material as ShaderMaterial
		shader.set_shader_parameter("active", true)
		await get_tree().create_timer(0.1).timeout
		shader.set_shader_parameter("active", false)

func apply_knockback(direction: Vector2) -> void:
	var knockback_force = direction * 50
	cb2d.global_position += knockback_force
