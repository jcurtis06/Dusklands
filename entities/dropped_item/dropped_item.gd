extends Sprite2D
class_name DroppedItem

@export var item: ItemStack
@export var speed: float = 50

var target: Node2D

func _ready() -> void:
	if item && item.texture:
		texture = item.texture
		set_process(true)

func _process(delta: float) -> void:
	if target:
		var direction = global_position.direction_to(target.global_position).normalized()
		global_position += direction * speed * delta
		look_at(target.global_position)
		
		if !target.has_method("pickup_item"):
			return
		
		var dist = global_position.distance_to(target.global_position)
		if dist < 1:
			target.pickup_item(item)
			queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("CanPickup"):
		target = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if target == body:
		target = null
