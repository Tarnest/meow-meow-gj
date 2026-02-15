extends Node2D

@export var start_scene: PackedScene
@onready var gears: Node2D = %Gears
@onready var gear_count_label: Label = $CanvasLayer/GearCounter/MarginContainer/GearCounter/GearCountLabel

var num_gears_curr: int = 8

func _ready() -> void:
	Global.check_gears.connect(check_gears)

func check_gears() -> void:
	var children: Array[Node] = gears.get_children()
	var num_gears_start: int = len(children)
	for child in children:
		if child is Gear:
			var gear: Gear = child
			if not gear.is_clean:
				num_gears_curr -= 1
				update_label()
				return
	print("all gears clean!")
	# Add Win State
	Global.switch_scene(start_scene)
	
func update_label() -> void:
	gear_count_label.text = str(num_gears_curr)
