extends Node3D

@export var packed_scene: PackedScene

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player_body"):
		get_tree().change_scene_to_packed(packed_scene)
