extends Node

signal check_gears

var scene_transition_file := preload("res://scenes/transition/scene_transition_animation.tscn")
var scene_transition: SceneTransition

func _ready() -> void:
	scene_transition = scene_transition_file.instantiate()
	add_child(scene_transition)

func switch_scene(scene: PackedScene) -> void:
	if scene == null:
		printerr("Null Scene")
		return
	
	scene_transition.animation_player.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_packed(scene)
	scene_transition.animation_player.play("fade_out")
