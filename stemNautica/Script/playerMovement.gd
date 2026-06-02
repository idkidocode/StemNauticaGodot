extends CharacterBody2D

@export var SPEED = 500.0
@export var ACCEL = 1000.0
@export var FRICTION = 400.0
@export var DOWNSPEED = 100.0

func _process(delta: float) -> void:
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if input_dir != Vector2.ZERO:
		# Accelerate when moving
		velocity = velocity.move_toward(input_dir * SPEED, ACCEL * delta)
	else:
		# Slow down using friction when idle
		velocity = velocity.move_toward(Vector2.DOWN, DOWNSPEED * delta)
		
	move_and_slide()
