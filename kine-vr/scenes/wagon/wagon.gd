extends RigidBody3D

@export var linear_speed: float = 1.0

func _ready() -> void:
	set_linear_velocity(Vector3(0.0, 0.0, linear_speed))
