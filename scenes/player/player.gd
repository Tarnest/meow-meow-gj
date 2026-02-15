class_name Player
extends CharacterBody2D

@onready var interaction: Area2D = %Interaction
@onready var animation_player: AnimationPlayer = %AnimationPlayer

var gravity: float = 20
var speed: int = 250
var direction_x: int:
	set(dir):
		last_direction = direction_x if direction_x != 0 else last_direction
		direction_x = dir

var last_direction: int = 1

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
		jump_velocity = -jump_speed - abs(direction_x * speed) / 4
		animate_jump()
	if Input.is_action_pressed("jump") and jump_timer < 0.1 and jump_velocity != 0:
		velocity.y = jump_velocity
		jump_timer += delta
	if Input.is_action_just_released("jump"):
		jump_timer += 10
	if !Input.is_action_pressed("jump") and is_on_floor():
		jump_timer = 0
		jump_velocity = 0
	if !is_on_floor():
		velocity.y += gravity
		animate_fall()
	
	direction_x = 0
	
	if Input.is_action_pressed("move_left"):
		direction_x += -1
	if Input.is_action_pressed("move_right"):
		direction_x += 1
	
	velocity.x = lerpf(velocity.x, direction_x * speed, 0.1)
	
	move_and_slide()

func animate_fall() -> void:
	if animation_player.is_playing():
		return
	
	match last_direction:
		1:
			animation_player.play("fall_right")
		-1:
			animation_player.play("fall_left")

func animate_jump() -> void:
	match last_direction:
		1:
			animation_player.play("jump_right")
		-1:
			animation_player.play("jump_left")
