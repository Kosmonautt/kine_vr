extends RigidBody3D

const INITIAL_POSITION: Vector3 = Vector3(1.0, 1.0, 4.0)
const LAUNCH_SPEED: float = 20

@export var direction_mesh: Node3D

var can_launch: bool = true

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
	can_launch = true


func _on_interactable_area_button_button_pressed(_button: Variant) -> void:
	if can_launch:
		set_gravity_scale(1.0)
		var launch_direction: Vector3 = direction_mesh.global_position - global_position
		linear_velocity = launch_direction.normalized() * LAUNCH_SPEED
		can_launch = false
