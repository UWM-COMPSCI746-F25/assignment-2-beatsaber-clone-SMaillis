extends Node3D

@onready var RedBox = load("res://Scenes/RedBox.tscn")
@onready var BlueBox = load("res://Scenes/BlueBox.tscn")
@onready var time = $Timer
var spawned = false

func _process(delta):
	print(time.time_left)
	if time.time_left < 0.05:
		if not spawned:
			var block_spawn = randi() % 2
			if block_spawn == 0:
				var instance = BlueBox.instantiate()
				add_child(instance)
			else:
				var instance = RedBox.instantiate()
				add_child(instance)
			spawned = true
			var new_time = randf_range(0.5, 2)
			print("new_time: ", new_time)
			time.set_wait_time(new_time)
			
	else:
		spawned = false

func _on_left_hand_button_pressed(name):
	if name == "trigger_click":
		var instance = RedBox.instantiate()
		add_child(instance)


func _on_right_hand_button_pressed(name):
	if name == "trigger_click":
		var instance = BlueBox.instantiate()
		add_child(instance)
