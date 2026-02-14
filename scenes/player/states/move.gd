class_name Move
extends State

@export var player: Player

func _physics_process(_delta: float) -> void:	
	if !Input.is_action_pressed("move"):
		state_finished.emit()
		
	animate()

func animate() -> void:
	match player.last_direction:
		1:
			player.animation_player.play("walk_right")
		-1:
			player.animation_player.play("walk_left")
