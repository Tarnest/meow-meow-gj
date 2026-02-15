class_name Move
extends State

@export var player: Player

func _physics_process(_delta: float) -> void:	
	player.direction_x = 0
	
	if Input.is_action_pressed("move_left"):
		player.direction_x += -1
	if Input.is_action_pressed("move_right"):
		player.direction_x += 1
	
	if !Input.is_action_pressed("move"):
		state_finished.emit()
		
	if player.is_on_floor():
		animate()

func animate() -> void:
	match player.last_direction:
		1:
			player.animation_player.play("walk_right")
		-1:
			player.animation_player.play("walk_left")
