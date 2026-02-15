extends Interactable

@export var switch_to_scene: PackedScene

func interact() -> void:	
	Global.switch_scene(switch_to_scene)
	
