class_name Clean
extends State

@export var player: Player

var cleaning: bool = false
var clean_time: float = 1.5

func _ready() -> void:
	set_physics_process(false)

func _enter() -> void:
	set_physics_process(true)
	player.direction_x = 0
	match player.last_direction:
		1:
			clean_right()
		-1:
			clean_left()

func _physics_process(_delta: float) -> void:
	if !player.animation_player.is_playing() && cleaning:
		state_finished.emit()
		player.sprite2d.visible = true
		player.clean_anim_left.visible = false
		player.clean_anim_right.visible = false
		player.current_gear.clean()

func clean_left() -> void:
	player.sprite2d.visible = false
	player.clean_anim_left.visible = true
	
	# wind up
	player.animation_player.play("Clean/clean_left_windup")
	
	# once wind up is done, loop
	player.animation_player.queue("Clean/clean_left_loop")
	await get_tree().create_timer(clean_time).timeout
	
	# after timer, wind down
	player.animation_player.play("Clean/clean_left_winddown")
	
	cleaning = true

func clean_right() -> void:
	player.sprite2d.visible = false
	player.clean_anim_right.visible = true
	
	# wind up
	player.animation_player.play("Clean/clean_right_windup")
	
	# once wind up is done, loop
	player.animation_player.queue("Clean/clean_right_loop")
	await get_tree().create_timer(clean_time).timeout
	
	# after timer, wind down
	player.animation_player.play("Clean/clean_right_winddown")
	
	cleaning = true
