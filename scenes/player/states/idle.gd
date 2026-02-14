class_name Idle
extends State

@export var player: Player

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("move"):
		state_finished.emit()
