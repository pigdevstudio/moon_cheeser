extends Position2D

export (PackedScene) var spawn_scene
export (float, 0, 10, 0.1) var min_spawn_time = 1.0
export (float, 0, 10 ,0.1) var max_spawn_time = 2.0

func _ready():
	randomize()
	get_node("Timer").set_wait_time(rand_range(min_spawn_time, max_spawn_time))

func _spawn():
	if get_parent().game_state == 0:
		var spawn = spawn_scene.instance()
		spawn.set_transform(get_transform())
		
		var pos_direction = get_viewport().get_rect().size.x /2
		if get_pos().x > pos_direction:
			spawn.direction = -1
		get_parent().add_child(spawn)
		get_node("Timer").set_wait_time(rand_range(min_spawn_time, max_spawn_time))
	else:
		pass