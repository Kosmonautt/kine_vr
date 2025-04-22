extends RigidBody3D

@export var linear_speed: float = 1.0

func _ready() -> void:
	set_linear_velocity(Vector3(linear_speed, 0.0, 0.0))
