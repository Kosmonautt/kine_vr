extends TabContainer

func refresh_screen(scenery_relative_position: Vector3, scenery_relative_velocity: Vector3, wagon_relative_position: Vector3, wagon_relative_velocity: Vector3) -> void:
	#### Scenery
	var scenery_relative_position_str := "%8.3f, %8.3f, %8.3f" % [scenery_relative_position.x, scenery_relative_position.y, scenery_relative_position.z]
	var scenery_relative_velocity_str := "%8.3f, %8.3f, %8.3f" % [scenery_relative_velocity.x, scenery_relative_velocity.y, scenery_relative_velocity.z]

	$Data/HBoxContainer/VBoxContainer/VBoxContainer/Position/Value.text = scenery_relative_position_str
	$Data/HBoxContainer/VBoxContainer/VBoxContainer/Velocity/Value.text = scenery_relative_velocity_str

	#### Scenery
	var wagon_relative_position_str := "%8.3f, %8.3f, %8.3f" % [wagon_relative_position.x, wagon_relative_position.y, wagon_relative_position.z]
	var wagon_relative_velocity_str := "%8.3f, %8.3f, %8.3f" % [wagon_relative_velocity.x, wagon_relative_velocity.y, wagon_relative_velocity.z]

	$Data/HBoxContainer/VBoxContainer/VBoxContainer2/Position/Value.text = wagon_relative_position_str
	$Data/HBoxContainer/VBoxContainer/VBoxContainer2/Velocity/Value.text = wagon_relative_velocity_str
	
func set_label_name(name: String, pos: int) -> void:
	if pos == 0:
		$Data/HBoxContainer/VBoxContainer/VBoxContainer/Name.text = name
	elif pos == 1:
		$Data/HBoxContainer/VBoxContainer/VBoxContainer2/Name.text = name
