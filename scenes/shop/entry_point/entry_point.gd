extends Interactable

@export var switch_to_scene: PackedScene

func interact() -> void:	
	if switch_to_scene != null:
		get_tree().change_scene_to_packed(switch_to_scene)
