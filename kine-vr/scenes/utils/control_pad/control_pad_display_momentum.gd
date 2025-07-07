extends TabContainer

func refresh_screen(projectile_left: RigidBody3D, projectile_right: RigidBody3D, left_launch_velocity: float, right_launch_velocity: float) -> void:
	### Projectile left data
	var proj_left_velocity_str := "%8.3f" % [projectile_left.get_linear_velocity().x]
	var proj_left_mass_str := "%8.3f" % [projectile_left.get_mass()]
	var proj_left_momentum_str := "%8.3f" % [get_linear_momentum(projectile_left)]
#
	$Data/HBoxContainer/VBoxContainer/LinearVelocityFirst/Value.text = proj_left_velocity_str
	$Data/HBoxContainer/VBoxContainer/MassFirst/Value.text = proj_left_mass_str
	$Data/HBoxContainer/VBoxContainer/LinearMomentumFirst/Value.text = proj_left_momentum_str

	### Projectile right data
	var proj_right_velocity_str := "%8.3f" % [projectile_right.get_linear_velocity().x]
	var proj_right_mass_str := "%8.3f" % [projectile_right.get_mass()]
	var proj_right_momentum_str := "%8.3f" % [get_linear_momentum(projectile_right)]
#
	$Data/HBoxContainer/VBoxContainer/LinearVelocitySecond/Value.text = proj_right_velocity_str
	$Data/HBoxContainer/VBoxContainer/MassSecond/Value.text = proj_right_mass_str
	$Data/HBoxContainer/VBoxContainer/LinearMomentumSecond/Value.text = proj_right_momentum_str
	
	### Total momentum
	var total_momentum_str := "%8.3f" % [get_linear_momentum(projectile_left) + get_linear_momentum(projectile_right)]
	
	$Data/HBoxContainer/VBoxContainer/LinearMomentumTotal/Value.text = total_momentum_str

	### Controller data
	var con_left_mass_str := "%8.3f" % [projectile_left.get_mass()]
	var con_left_velocity_str := "%8.3f" % [left_launch_velocity]
	var con_right_mass_str := "%8.3f" % [projectile_right.get_mass()]
	var con_right_velocity_str := "%8.3f" % [right_launch_velocity]
	
	$Data/HBoxContainer/VBoxContainerControl/LeftMass/Value.text = con_left_mass_str
	$Data/HBoxContainer/VBoxContainerControl/LeftVelocity/Value.text = con_left_velocity_str
	$Data/HBoxContainer/VBoxContainerControl/RightMass/Value.text = con_right_mass_str
	$Data/HBoxContainer/VBoxContainerControl/RightVelocity/Value.text = con_right_velocity_str

func get_linear_momentum(projectile: RigidBody3D) -> float:
	return projectile.get_mass() * projectile.get_linear_velocity().x

func set_label_name(name: String, pos: int) -> void:
	if pos == 0:
		$Data/HBoxContainer/VBoxContainer/NameFirst.text = name
	elif pos == 1:
		$Data/HBoxContainer/VBoxContainer/NameSecond.text = name
