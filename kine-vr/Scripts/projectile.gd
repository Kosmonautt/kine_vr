extends RigidBody3D

const initial_position: Vector3 = Vector3(-4.5, 1, 0)
const launch_speed: float = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = initial_position
	set_gravity_scale(0.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass


func _on_parabola_body_exited(_body) -> void:
	position = initial_position
	linear_velocity = Vector3.ZERO
	set_gravity_scale(0.0)

	
func launch(launch_direction : Vector3) -> void:
	set_gravity_scale(1.0)
	launch_direction = launch_direction - global_position
	linear_velocity = launch_direction.normalized() * launch_speed
