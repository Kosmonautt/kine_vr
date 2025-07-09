extends TabContainer

func refresh_screen(projectile: RigidBody3D, theta: float, phi: float, paused: bool) -> void:
	if paused:
		return
	
	## Projectile data
	var pos: Vector3 = projectile.get_position()
	var vel: Vector3 = projectile.get_linear_velocity()
	var rot: Vector3 = projectile.get_rotation_degrees()
	var pos_str := "%8.3f, %8.3f, %8.3f" % [pos.x, pos.y, pos.z]
	var vel_str := "%8.3f, %8.3f, %8.3f" % [vel.x, vel.y, vel.z]
	var rot_str := "%8.3f, %8.3f, %8.3f" % [rot.x, rot.y + 90, rot.z]

	$Data/HBoxContainer/VBoxContainer/Position/Value.text = pos_str
	$Data/HBoxContainer/VBoxContainer/Velocity/Value.text = vel_str
	$Data/HBoxContainer/VBoxContainer/Angle/Value.text = rot_str

	## Controller data
	var con_theta_str := "%8.3f" % [rad_to_deg(theta)]
	var con_phi_str := "%8.3f" % [rad_to_deg(phi)]
	
	$Data/HBoxContainer/VBoxContainerControls/AngleTheta/Value.text = con_theta_str
	$Data/HBoxContainer/VBoxContainerControls/AnglePhi/Value.text = con_phi_str

func set_label_name(name: String) -> void:
	$Data/HBoxContainer/VBoxContainer/Name.text = name
