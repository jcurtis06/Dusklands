extends CharacterBody2D

@export var speed: float = 300.0
@export var test_block: BlockData

@onready var world: World = get_parent()
@onready var attack := $AttackComponent
@onready var animation := $Sprite

func _physics_process(delta: float) -> void:
	# MOVEMENT
	var input = Input.get_vector("left", "right", "up", "down")
	velocity = input * speed
	
	move_and_slide()
	
	# ATTACK
	if Input.is_action_just_pressed("attack"):
		attack.attack(1)
	
	# BUILD
	if Input.is_action_just_pressed("interact"):
		world.block_grid.set_block_at(get_global_mouse_position(), test_block)
	
	# ANIMATIONS
	_handle_animations()

func _handle_animations() -> void:
	if velocity.is_zero_approx():
		return
	
	if velocity.y > 0:
		animation.play("walk_down")
		return
	elif velocity.y < 0:
		animation.play("walk_up")
		return
	
	if velocity.x > 0:
		animation.flip_h = false
		animation.play("walk_right")
	else:
		animation.flip_h = true
		animation.play("walk_right")
