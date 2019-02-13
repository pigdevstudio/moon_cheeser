extends Node2D

export (PackedScene) var spawnling

func _ready():
	randomize()


func spawn():
	var instance = spawnling.instance()
	instance.global_position = global_rotation
	
	get_parent().add_child(instance)
