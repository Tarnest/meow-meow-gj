extends StateMachine

@export var player: Player

@onready var idle: Idle = %Idle
@onready var move: Move = %Move
@onready var clean: Clean = %Clean

func _ready() -> void:
	change_state(state)
	idle.state_finished.connect(_on_idle_finished)
	move.state_finished.connect(_on_move_finished)
	clean.state_finished.connect(_on_clean_finished)
	
	player.clean.connect(_on_clean)

func _on_idle_finished() -> void:
	change_state(move)

func _on_move_finished() -> void:
	change_state(idle)

func _on_clean_finished() -> void:
	change_state(idle)

func _on_clean() -> void:
	change_state(clean)
