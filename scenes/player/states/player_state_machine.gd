extends StateMachine

@onready var idle: Idle = %Idle
@onready var move: Move = %Move

func _ready() -> void:
	change_state(state)
	idle.state_finished.connect(_on_idle_finished)
	move.state_finished.connect(_on_move_finished)

func _on_idle_finished() -> void:
	change_state(move)

func _on_move_finished() -> void:
	change_state(idle)
