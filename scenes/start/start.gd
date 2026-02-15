extends Node2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var start_button: Button = $CanvasLayer/GridContainer/StartButton
@onready var exit_button: Button = $CanvasLayer/GridContainer/ExitButton

var prev_button: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.mouse_entered.connect(_mouse_entered_start_btn)
	start_button.mouse_exited.connect(_mouse_exited)
	exit_button.mouse_entered.connect(_mouse_entered_exit_btn)
	exit_button.mouse_exited.connect(_mouse_exited)

func _mouse_entered_start_btn() -> void:
	if prev_button != 0:
		animated_sprite.play("start")
		prev_button = 0
	
func _mouse_entered_exit_btn() -> void:
	if prev_button != 1:
		animated_sprite.play("exit")
		prev_button = 1
	
func _mouse_exited() -> void:
	pass
