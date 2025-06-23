extends MeshInstance3D

@export var rotor_sphere: MeshInstance3D
@export var plane: Node3D
@export_enum("Sine", "Cosine") var mode: int
@export var decal_scene: PackedScene

# colors for decals
const sine_decal_color = Color(0, 1, 0)
const cosine_decal_color = Color(0, 0, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# sine mode
	if mode == 0:
		# sphere follows rotor
		set_global_position(Vector3(4, rotor_sphere.get_global_position().y, -4))
	# cosine mode
	if mode == 1:
		set_global_position(Vector3(rotor_sphere.get_global_position().x, 0, -4))


func _on_timer_timeout() -> void:
	# a decal is spawned
	var decal = decal_scene.instantiate()
	# decal is added to the plane
	plane.add_child(decal)
	# the initial position is set
	decal.set_global_position(Vector3(get_global_position()))
	# color change
	# sine mode
	if mode == 0:
		decal.change_color(sine_decal_color)
	# cosine mode
	elif mode == 1:
		decal.change_color(cosine_decal_color)
