extends CharacterBody2D

@export var speed: float = 300.0

@onready var attack := $AttackComponent

func _physics_process(delta: float) -> void:
	# MOVEMENT
	var input = Input.get_vector("left", "right", "up", "down")
	velocity = input * speed
	
	move_and_slide()
	
	# ATTACK
	if Input.is_action_just_pressed("attack"):
		attack.attack(1)
