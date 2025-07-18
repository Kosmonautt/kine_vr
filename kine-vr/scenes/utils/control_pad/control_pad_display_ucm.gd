extends TabContainer

func refresh_screen(radius: float, angular_speed: float, rotation_deegrees: float) -> void:#	
	var rad: float = radius
	var rot: float = natural_degrees(rotation_deegrees)
	var rot_speed: float = rad_to_deg(angular_speed)
	var tan_speed: float = angular_speed * rad
	var per: float = (2*PI)/angular_speed
	var fre: float = 1/per
	var rad_str := "%8.3f" % [rad]
	var rot_str := "%8.3f" % [rot]
	var rot_speed_str := "%8.3f" % [rot_speed]
	var tan_speed_str := "%8.3f" % [tan_speed]
	var per_str := "%8.3f" % [per]
	var fre_Str := "%8.3f" % [fre]
	
	$Data/HBoxContainer/VBoxContainer/Radius/Value.text = rad_str
	$Data/HBoxContainer/VBoxContainer/Rotation/Value.text = rot_str
	$Data/HBoxContainer/VBoxContainer/RotationSpeed/Value.text = rot_speed_str
	$Data/HBoxContainer/VBoxContainer/TangentialSpeed/Value.text = tan_speed_str
	$Data/HBoxContainer/VBoxContainer/Period/Value.text = per_str
	$Data/HBoxContainer/VBoxContainer/Frequency/Value.text = fre_Str

func set_label_name(name: String) -> void:
	$Data/HBoxContainer/VBoxContainer/Name.text = name

# changes degrees from [0, 1, ..., 180, -180, ..., -179, ..., -1, -0] to [0, 360]
func natural_degrees(degrees: float) -> float:
	if degrees < 0:
		degrees = 360 + degrees
	
	return degrees
