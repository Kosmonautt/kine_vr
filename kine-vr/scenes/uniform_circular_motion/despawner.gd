extends Area3D


func _on_area_entered(area: Area3D) -> void:
	# decal is despawned
	area.get_parent().queue_free()
