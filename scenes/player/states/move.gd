class_name Move
extends State

@export var player: Player

func _physics_process(_delta: float) -> void:
	player.direction_x = 0
	
	if Input.is_action_pressed("move_left"):
		player.direction_x += -1
	if Input.is_action_pressed("move_right"):
		player.direction_x += 1
	
	if player.direction_x == 0:
		state_finished.emit()
