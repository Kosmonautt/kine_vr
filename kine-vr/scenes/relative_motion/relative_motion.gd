extends Node3D

@export var linear_speed: float = 1

@export var wagon: RigidBody3D
@export var projectile: RigidBody3D
@export var wheel_1: Node3D
@export var wheel_2: Node3D
@export var wheel_3: Node3D
@export var wheel_4: Node3D

# radius of the wheels
var radius: float = 0.125
var angular_speed: float = linear_speed / radius

func _ready() -> void:
	wagon.set_linear_velocity(Vector3(0.0, 0.0, linear_speed))
	projectile.set_linear_velocity(Vector3(0.0, 0.0, linear_speed))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	wheel_1.rotate_x(angular_speed * delta)
	wheel_2.rotate_x(angular_speed * delta)
	wheel_3.rotate_x(angular_speed * delta)
	wheel_4.rotate_x(angular_speed * delta)


func _on_boundary_body_entered(body: Node3D) -> void:
	if body == wagon:
		wagon.set_position(Vector3(1.5, 0.0, 3.0))
