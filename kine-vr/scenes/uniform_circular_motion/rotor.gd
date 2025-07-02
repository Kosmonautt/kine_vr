extends Node3D

const DEFAULT_ANGULAR_SPEED = 3
const DEFAULT_RADIUS = 0.5


@export var blade: MeshInstance3D
@export var sphere: MeshInstance3D
@export var angular_speed: float = DEFAULT_ANGULAR_SPEED
@export var radius: float = DEFAULT_RADIUS:
	get:
		return radius
	set(value):
		radius = value
		set_size(radius)
		
@onready var blade_mesh: PlaneMesh = blade.get_mesh()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	rotate_y(angular_speed * delta)
	
	
func set_size(r: float) -> void:
	# blade size and position
	blade_mesh.set_size(Vector2(0.05, radius))
	blade.set_position(Vector3(0.0, r/2 , 0.0))
	# sphere position
	sphere.set_position(Vector3(0, r, 0))


func _on_interactable_slider_angular_speed_slider_moved(p: Variant) -> void:
	# position [0.0, 0.4] meters to [0.0, 1.0]
	var percentage: float = smoothstep(0.0, 0.4, p)

	# number [0.0, 1.0] transformed to [0.0, 2PI] radians/s
	angular_speed = lerp(0.0, 2 * PI, percentage)


func _on_interactable_slider_radius_slider_moved(p: Variant) -> void:
	# position [0.0, 0.4] meters to [0.0, 1.0]
	var percentage: float = smoothstep(0.0, 0.4, p)

	# number [0.0, 1.0] transformed to [0.5, 4.0] meters
	radius = lerp(0.5, 4.0, percentage)
