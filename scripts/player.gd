extends CharacterBody3D

@export var speed = 15
@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO

func _physics_process(delta: float) -> void:
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("jump"):
		pass
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	
	# Ground Velocity	
	target_velocity.z = direction.z * speed
	
	# Gravity
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
	
	# Movement	
	velocity = target_velocity
	move_and_slide()
