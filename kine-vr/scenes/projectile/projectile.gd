extends RigidBody3D

const INITIAL_POSITION: Vector3 = Vector3(1.0, 1.0, 4.0)
const LAUNCH_SPEED: float = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = INITIAL_POSITION
	set_gravity_scale(0.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass


func _on_scenery_body_exited(_body: Node3D) -> void:
	position = INITIAL_POSITION
	linear_velocity = Vector3.ZERO
	set_gravity_scale(0.0)

func _on_pivot_launch_button_pressed(launch_direction: Vector3) -> void:
	set_gravity_scale(1.0)
	launch_direction = launch_direction - global_position
	linear_velocity = launch_direction.normalized() * LAUNCH_SPEED
