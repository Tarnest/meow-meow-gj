extends CharacterBody2D

var gravity: float = 5000
var speed: int = 300
var jump_speed: int = 1200
var direction_x: int = 0

func _physics_process(delta: float) -> void:
	direction_x = 0
	
	if Input.is_action_pressed("move_left"):
		direction_x += -1
	if Input.is_action_pressed("move_right"):
		direction_x += 1
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed
	
	velocity.x = direction_x * speed
	velocity.y += gravity * delta
	move_and_slide()
