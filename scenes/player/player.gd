class_name Player
extends CharacterBody2D

@onready var interaction: Area2D = %Interaction

var gravity: float = 20
var speed: int = 250
var direction_x: int = 0

var jump_speed: int = 320
var jump_timer: float = 0.0
var jump_velocity: float = 0.0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		var areas: Array[Area2D] = interaction.get_overlapping_areas()
		for area in areas:
			if area is Interactable:
				var interactable: Interactable = area
				interactable.interact()
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_velocity = -jump_speed - abs(direction_x * speed) / 3
	if Input.is_action_pressed("jump") and jump_timer < 0.1:
		velocity.y = jump_velocity
		jump_timer += delta
	if Input.is_action_just_released("jump"):
		jump_timer += 10
	if !Input.is_action_pressed("jump") and is_on_floor():
		jump_timer = 0
		jump_velocity = 0
	if !is_on_floor():
		velocity.y += gravity
	
	velocity.x = lerpf(velocity.x, direction_x * speed, 0.1)
	
	move_and_slide()
	
	
