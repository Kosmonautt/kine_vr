extends TabContainer

func refresh_screen(projectile: RigidBody3D, target: RigidBody3D, theta: float, radius: float, launch_speed: float, time_elapsed: float, paused: float) -> void:
	if paused:
		return
	
	## Projectile data
	var proj_pos: Vector3 = projectile.get_position()
	var proj_vel: Vector3 = projectile.get_linear_velocity()
	var proj_rot: Vector3 = projectile.get_rotation_degrees()
	var proj_pos_str := "%8.3f, %8.3f, %8.3f" % [proj_pos.x, proj_pos.y, proj_pos.z]
	var proj_vel_str := "%8.3f, %8.3f, %8.3f" % [proj_vel.x, proj_vel.y, proj_vel.z]
	var proj_rot_str := "%8.3f, %8.3f, %8.3f" % [proj_rot.x, proj_rot.y, proj_rot.z]

	$Data/HBoxContainer/VBoxContainer/VBoxContainer/Position/Value.text = proj_pos_str
	$Data/HBoxContainer/VBoxContainer/VBoxContainer/Velocity/Value.text = proj_vel_str
	$Data/HBoxContainer/VBoxContainer/VBoxContainer/Angle/Value.text = proj_rot_str
	
	## Target data
	var tar_pos: Vector3 = target.get_position()
	var tar_vel: Vector3 = target.get_linear_velocity()
	var tar_rot: Vector3 = target.get_rotation_degrees()
	var tar_pos_str := "%8.3f, %8.3f, %8.3f" % [tar_pos.x, tar_pos.y, tar_pos.z]
	var tar_vel_str := "%8.3f, %8.3f, %8.3f" % [tar_vel.x, tar_vel.y, tar_vel.z]
	var tar_rot_str := "%8.3f, %8.3f, %8.3f" % [tar_rot.x, tar_rot.y, tar_rot.z]

	$Data/HBoxContainer/VBoxContainer/VBoxContainer2/Position/Value.text = tar_pos_str
	$Data/HBoxContainer/VBoxContainer/VBoxContainer2/Velocity/Value.text = tar_vel_str
	$Data/HBoxContainer/VBoxContainer/VBoxContainer2/Angle/Value.text = tar_rot_str
	
	## Controller data
	var con_rot_str := "%8.3f" % [rad_to_deg(theta)]
	var con_dist_str := "%8.3f" % [radius]
	var con_launch_speed_str := "%8.3f" % [launch_speed]
	
	$Data/HBoxContainer/VBoxContainerControls/Angle/Value.text = con_rot_str
	$Data/HBoxContainer/VBoxContainerControls/Distance/Value.text = con_dist_str
	$Data/HBoxContainer/VBoxContainerControls/LaunchSpeed/Value.text = con_launch_speed_str

	## Time elapsed
	var time_elapsed_str := "%8.3f" % [time_elapsed]
	
	$Data/HBoxContainer/VBoxContainer/TimeElapsed/Value.text = time_elapsed_str

func set_label_name(name: String, pos: int) -> void:
	if pos == 0:
		$Data/HBoxContainer/VBoxContainer/VBoxContainer/Name.text = name
	elif pos == 1:
		$Data/HBoxContainer/VBoxContainer/VBoxContainer2/Name.text = name
	
