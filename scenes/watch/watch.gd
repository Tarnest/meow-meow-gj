extends Node2D

@export var start_scene: PackedScene
@onready var gears: Node2D = %Gears

func _ready() -> void:
	Global.check_gears.connect(check_gears)

func check_gears() -> void:
	var children: Array[Node] = gears.get_children()
	for child in children:
		if child is Gear:
			var gear: Gear = child
			if not gear.is_clean:
				return
	print("all gears clean!")
	# Add Win State
	Global.switch_scene(start_scene)
