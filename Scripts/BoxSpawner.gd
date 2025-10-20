extends Node3D

@onready var RedBox = load("res://Scenes/RedBox.tscn")
@onready var BlueBox = load("res://Scenes/BlueBox.tscn")



func _on_left_hand_button_pressed(name):
	if name == "trigger_click":
		var instance = RedBox.instantiate()
		add_child(instance)


func _on_right_hand_button_pressed(name):
	if name == "trigger_click":
		var instance = BlueBox.instantiate()
		add_child(instance)
