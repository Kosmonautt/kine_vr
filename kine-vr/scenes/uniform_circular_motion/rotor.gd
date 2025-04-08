extends Node3D

const DEFAULT_ANGULAR_SPEED = 0
const DEFAULT_RADIUS = 0


@export var blade: MeshInstance3D
var angular_speed: float = DEFAULT_ANGULAR_SPEED
var radius: float = DEFAULT_RADIUS:
	get:
		return radius
	set(value):
		radius = value
		set_size(radius)
		
@onready var blade_mesh: PlaneMesh = blade.get_mesh()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	rotate_z(-angular_speed * delta)
	
	
func set_size(r: float) -> void:
	# blade size and position
	blade_mesh.set_size(Vector2(0.05, radius))
	blade.set_position(Vector3(0.0, r/2 , 0.0))
