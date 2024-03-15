extends CharacterBody2D

@export var speed: float = 300.0

func _physics_process(delta: float) -> void:
	var input = Input.get_vector("left", "right", "up", "down")
	velocity = input * speed
	
	move_and_slide()
