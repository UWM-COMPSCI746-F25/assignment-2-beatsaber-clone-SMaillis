extends XRController3D

var grabbed_object = null
var collided_area = null

var saber_on = true

@export var raycast_length = 1.0

func _process(delta):
	if grabbed_object:
		grabbed_object.global_position = global_position
		
func _physics_process(delta):
	var space_state = get_world_3d().direct_space_state
	var origin = global_position
	var dir = global_basis.z * -1
	var end
	if saber_on:
		end = origin + (dir * raycast_length) 
	else:
		end = origin
	
	var query = PhysicsRayQueryParameters3D.create(origin, end)
	query.collide_with_areas = true
	var result = space_state.intersect_ray(query)
	
	$"LineRendererLeft".points[0] = origin
	$"LineRendererLeft".points[1] = end

func _on_area_3d_body_entered(area):
	collided_area = area

func _on_area_3d_body_exited(area):
	collided_area = null

func _on_button_pressed(name):
	if name == "ax_button":
		if saber_on:
			saber_on = false
		else:
			saber_on = true

func _on_button_released(name):
	if name == "grip_click":
		grabbed_object = null
