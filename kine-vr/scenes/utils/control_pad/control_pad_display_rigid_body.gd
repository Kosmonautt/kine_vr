extends TabContainer

var num: float = 0.0

func refresh_screen(projectile: RigidBody3D) -> void:
	var pos: Vector3 = projectile.get_position()
	var vel: Vector3 = projectile.get_linear_velocity()
	var rot: Vector3 = projectile.get_rotation_degrees()
	var pos_str := "%8.3f, %8.3f, %8.3f" % [pos.x, pos.y, pos.z]
	var vel_str := "%8.3f, %8.3f, %8.3f" % [vel.x, vel.y, vel.z]
	var rot_str := "%8.3f, %8.3f, %8.3f" % [rot.x, rot.y, rot.z]

	$Data/VBoxContainer/Position/Value.text = pos_str
	$Data/VBoxContainer/Velocity/Value.text = vel_str
	$Data/VBoxContainer/Angle/Value.text = rot_str

func set_label_name(name: String) -> void:
	$Data/VBoxContainer/Name.text = name
	
