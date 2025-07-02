extends TabContainer

func refresh_screen(radius: float, angular_speed: float, rotation_deegrees: float) -> void:#
	#$Data/VBoxContainer/Position/Value.text = pos_str
	#$Data/VBoxContainer/Velocity/Value.text = vel_str
	#$Data/VBoxContainer/Angle/Value.text = rot_str
	
	var rad: float = radius
	var rot: float = rotation_deegrees
	var rot_speed: float = rad_to_deg(angular_speed)
	var tan_speed: float = rot_speed * rad
	var per: float = (2*PI)/angular_speed
	var fre: float = 1/per
	var rad_str := "%8.3f" % [rad]
	var rot_str := "%8.3f" % [rot]
	var rot_speed_str := "%8.3f" % [rot_speed]
	var tan_speed_str := "%8.3f" % [tan_speed]
	var per_str := "%8.3f" % [per]
	var fre_Str := "%8.3f" % [fre]
	
	$Data/VBoxContainer/Radius/Value.text = rad_str
	$Data/VBoxContainer/Rotation/Value.text = rot_str
	$Data/VBoxContainer/RotationSpeed/Value.text = rot_speed_str
	$Data/VBoxContainer/TangentialSpeed/Value.text = tan_speed_str
	$Data/VBoxContainer/Period/Value.text = per_str
	$Data/VBoxContainer/Frequency/Value.text = fre_Str

func set_label_name(name: String) -> void:
	$Data/VBoxContainer/Name.text = name
