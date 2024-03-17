extends Area2D
class_name HitboxComponent

@export var health_component: HealthComponent
@export var flashable_sprite: AnimatedSprite2D

func damage(amount: float) -> void:
	if health_component:
		health_component.deduct(amount)
		print("damaged: " + get_parent().name)
	
	if flashable_sprite:
		var shader: ShaderMaterial = flashable_sprite.material as ShaderMaterial
		shader.set_shader_parameter("active", true)
		await get_tree().create_timer(0.1).timeout
		shader.set_shader_parameter("active", false)
