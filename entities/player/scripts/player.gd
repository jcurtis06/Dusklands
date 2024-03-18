extends CharacterBody2D

@export var speed: float = 300.0
@export var hotbar: Inventory

@onready var world: World = get_parent()
@onready var attack := $AttackComponent
@onready var animation := $Sprite

var active_item: BlockData

func _physics_process(delta: float) -> void:
	# MOVEMENT
	var input = Input.get_vector("left", "right", "up", "down")
	velocity = input * speed
	
	move_and_slide()
	
	# ATTACK
	if Input.is_action_just_pressed("attack"):
		attack.attack(1)
	
	hotbar_selection()
	
	# BUILD
	if Input.is_action_just_pressed("interact"):
		if active_item == null || active_item.count <= 0:
			return
		
		world.block_grid.set_block_at(get_global_mouse_position(), active_item)
		hotbar.remove_item(active_item)
	
	# ANIMATIONS
	_handle_animations()

func pickup_item(item: BlockData) -> void:
	hotbar.add_item(item)

func hotbar_selection() -> void:
	if Input.is_action_just_pressed("slot_1"):
		active_item = hotbar.slots[0]
	if Input.is_action_just_pressed("slot_2"):
		active_item = hotbar.slots[1]
	if Input.is_action_just_pressed("slot_3"):
		active_item = hotbar.slots[2]
	if Input.is_action_just_pressed("slot_4"):
		active_item = hotbar.slots[3]
	if Input.is_action_just_pressed("slot_5"):
		active_item = hotbar.slots[4]
	if Input.is_action_just_pressed("slot_6"):
		active_item = hotbar.slots[5]
	if Input.is_action_just_pressed("slot_7"):
		active_item = hotbar.slots[6]
	if Input.is_action_just_pressed("slot_8"):
		active_item = hotbar.slots[7]
	if Input.is_action_just_pressed("slot_9"):
		active_item = hotbar.slots[8]

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
