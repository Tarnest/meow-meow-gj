extends CharacterBody2D

@onready var interaction: Area2D = %Interaction

var gravity: float = 3000
var speed: int = 300
var jump_speed: int = 600
var direction_x: int = 0

func _physics_process(delta: float) -> void:
	direction_x = 0
	
	if Input.is_action_pressed("move_left"):
		direction_x += -1
	if Input.is_action_pressed("move_right"):
		direction_x += 1
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed
	if Input.is_action_just_pressed("interact"):
		var areas: Array[Area2D] = interaction.get_overlapping_areas()
		for area in areas:
			if area is Interactable:
				var interactable: Interactable = area
				interactable.interact()
	
	velocity.x = direction_x * speed
	velocity.y += gravity * delta
	move_and_slide()
