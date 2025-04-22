extends RigidBody3D

@export var linear_speed: float = 1.0

@export var wheel_1: Node3D
@export var wheel_2: Node3D
@export var wheel_3: Node3D
@export var wheel_4: Node3D

var angular_speed: float = PI

func _ready() -> void:
	set_linear_velocity(Vector3(linear_speed, 0.0, 0.0))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	wheel_1.rotate_x(angular_speed * delta)
	wheel_2.rotate_x(angular_speed * delta)
	wheel_3.rotate_x(angular_speed * delta)
	wheel_4.rotate_x(angular_speed * delta)
