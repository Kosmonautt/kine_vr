extends Node3D

@export var projectile1: RigidBody3D
@export var projectile2: RigidBody3D

func _physics_process(delta: float) -> void:
	var message_format: String = "p1 momentum: %f  p2 momentum: %f total momentum: %f p1 ke: %f"
	var p1momentum: float = projectile1.get_mass() * projectile1.get_linear_velocity().x
	var p2momentum: float = projectile2.get_mass() * projectile2.get_linear_velocity().x
	var p1ke: float = (projectile1.get_mass() * pow(projectile1.linear_velocity.length(), 2) )/2
	var p2ke: float = (projectile2.get_mass() * pow(projectile2.linear_velocity.length(), 2) )/2
	var message: String = message_format % [p1momentum, p2momentum, p1momentum + p2momentum, p1ke + p2ke]
	
	print(message)
