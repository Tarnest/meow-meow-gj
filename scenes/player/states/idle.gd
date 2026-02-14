class_name Idle
extends State

@export var player: Player

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("move"):
		state_finished.emit()
	
	if player.is_on_floor():
		animate()

func animate() -> void:
	match player.last_direction:
		1:
			player.animation_player.play("idle_right")
		-1:
			player.animation_player.play("idle_left")
