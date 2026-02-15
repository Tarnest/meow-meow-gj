class_name Gear
extends Interactable

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var gear_fixed_sound: AudioStreamPlayer2D = %GearFixedSound
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
	gear_fixed_sound.play()
	Global.check_gears.emit()
