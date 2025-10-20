extends Node3D

@export var velocity = 10.0

func _process(delta):
	if global_position.z < -0.5:
		global_position.z += velocity * delta
	if global_position.z > -0.5:
		global_position.z = -0.5
