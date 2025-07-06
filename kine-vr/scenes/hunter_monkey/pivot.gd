extends Node3D

@export var direction: Node3D
@export var direction_mesh: Node3D
@export var projectile: Node3D
@export var target: Node3D

var radius: float = 8.0
var theta: float = 0.0

func _on_interactable_lever_theta_hinge_moved(angle: Variant) -> void:
	# angle [-45, 45] degrees to [0.0, 1.0]
	var percentage: float = smoothstep(45.0, -45.0, angle)
	
	# number [0.0, 1.0] transformed to [-PI/2, PI/2] radians
	theta = lerp(0.0, PI/2, percentage)
	
	# set z rotation angle
	direction.rotation.z = theta
	projectile.look_at(direction_mesh.global_position, Vector3.UP)
	
	# set target position
	target.set_position(Vector3(radius * cos(projectile.rotation.x) , radius * sin(projectile.rotation.x) , 3.0))
	# refresh target respawn position
	target.respawn_position = target.get_position()

func _on_interactable_lever_phi_hinge_moved(angle: Variant) -> void:
	# angle [-45, 45] degrees to [0.0, 1.0]
	var percentage: float = smoothstep(-45.0, 45.0, angle)

	# number [0.0, 1.0] transformed to [0, -PI] radians
	var phi: float = lerp(PI/2, -PI/2, percentage)

	# set y rotation angle
	direction.rotation.y = phi
	projectile.look_at(direction_mesh.global_position, Vector3.UP)


func _on_interactable_slider_radius_slider_moved(p: Variant) -> void:
	# position [0.0, 0.2] meters to [0.0, 1.0]
	var percentage: float = smoothstep(0.0, 0.2, p)
	
	# number [0.0, 1.0] transformed to [8.0, 100.0] meters
	radius = lerp(4.0, 100.0, percentage)
	
	# set target position
	target.set_position(Vector3(radius * cos(projectile.rotation.x) , radius * sin(projectile.rotation.x) , 3.0))
	# refresh target respawn position
	target.respawn_position = target.get_position()
