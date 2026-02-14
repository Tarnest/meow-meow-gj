class_name Gear
extends Interactable

@onready var animation_player: AnimationPlayer = %AnimationPlayer
var is_clean: bool = false

func _ready() -> void:
	animation_player.play("rusty")

func interact() -> void:
	if not is_clean:
		clean()

func clean() -> void:
	is_clean = true
	animation_player.play("clean")
	print("clean")
	Global.check_gears.emit()
