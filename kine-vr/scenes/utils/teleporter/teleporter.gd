extends Node3D

@export_enum("Main", "Parabola" , "Hunter Monkey", "Uniform Circular Motion", "Relative Motion", "Linear Momentum") var destination: int


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player_body"):
		if destination == 0:
			get_tree().change_scene_to_file("res://scenes/main/main.tscn")
		if destination == 1:
			get_tree().change_scene_to_file("res://scenes/parabola/parabola.tscn")
		if destination == 2:
			get_tree().change_scene_to_file("res://scenes/hunter_monkey/hunter_monkey.tscn")
		if destination == 3:
			get_tree().change_scene_to_file("res://scenes/uniform_circular_motion/uniform_circular_motion.tscn")
		if destination == 4:
			get_tree().change_scene_to_file("res://scenes/relative_motion/relative_motion.tscn")
		if destination == 5:
			get_tree().change_scene_to_file("res://scenes/linear_momentum/monetum.tscn")
		
		
