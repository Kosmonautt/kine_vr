extends Node3D

@export_enum("Main", "Parabola" , "Hunter Monkey",) var destination: int


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player_body"):
		if destination == 0:
			get_tree().change_scene_to_file("res://scenes/main/main.tscn")
		if destination == 1:
			get_tree().change_scene_to_file("res://scenes/parabola/parabola.tscn")
		if destination == 2:
			get_tree().change_scene_to_file("res://scenes/hunter_monkey/hunter_monkey.tscn")	
