extends MeshInstance3D

@export var rotor_sphere: MeshInstance3D
@export_enum("Sine", "Cosine") var mode: int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# sine mode
	if mode == 0:
		set_global_position(Vector3(4, rotor_sphere.get_global_position().y, 0))
	if mode == 1:
		set_global_position(Vector3(rotor_sphere.get_global_position().x, 0, 0))
