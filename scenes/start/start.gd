extends Node2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var start_button: Button = $CanvasLayer/StartButton
@onready var exit_button: Button = $CanvasLayer/ExitButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.mouse_entered.connect(_mouse_entered_start_btn)
	start_button.mouse_exited.connect(_mouse_exited)
	exit_button.mouse_entered.connect(_mouse_entered_exit_btn)
	exit_button.mouse_exited.connect(_mouse_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _mouse_entered_start_btn() -> void:
	animated_sprite.play("start")
	
func _mouse_entered_exit_btn() -> void:
	animated_sprite.play("exit")
	
func _mouse_exited() -> void:
	pass
