extends Node3D

@export var dir = Vector3(0,0,1)
@export var speed = 5.0

func _ready():
	global_position.y = randf_range(0.5, 2)
	global_position.x = randf_range(-1, 0.5)

func _process(delta):
	global_position += dir * (speed * delta)
	if global_position.z > 5.0:
		queue_free()
