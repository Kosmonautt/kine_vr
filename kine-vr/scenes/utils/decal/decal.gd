extends Node3D

# speed in m/s
@export var speed: float = 3.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	set_global_position(Vector3(get_global_position().x, get_global_position().y, get_global_position().z + (speed * delta)))

func change_color(color: Color) -> void:
	# change mesh color
	$MeshInstance3D.get_mesh().surface_get_material(0).albedo_color = color
