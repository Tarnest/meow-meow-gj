extends Area2D

@export var is_clean: bool = false
var player_in_range: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	print("Gear Ready")
	
func _on_area_entered(body: Node2D) -> void:
	print("Player detected")
	player_in_range = true

func _on_area_exited(body: Node2D) -> void:
	print("Player left area")
	player_in_range = false
	
func clean() -> void:
	is_clean = true
	print("cleaned!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# wait for player input if in range
	if player_in_range and not is_clean and Input.is_action_just_pressed("ui_accept"):
		clean()
