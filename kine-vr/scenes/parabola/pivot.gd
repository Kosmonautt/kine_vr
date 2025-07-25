extends Node3D

@export var direction: Node3D
@export var direction_mesh: Node3D
@export var projectile: Node3D

var theta: float
var phi: float

func _on_interactable_theta_lever_hinge_moved(angle: Variant) -> void:
	# angle [-45, 45] degrees to [0.0, 1.0]
	var percentage: float = smoothstep(45.0, -45.0, angle)
	
	# number [0.0, 1.0] transformed to [-PI/2, PI/2] radians
	theta = lerp(-PI/2, PI/2, percentage)
	
	# set z rotation angle
	direction.rotation.z = theta
	projectile.look_at(direction_mesh.global_position, Vector3.UP)


func _on_interactable_phi_lever_hinge_moved(angle: Variant) -> void:
	# angle [-45, 45] degrees to [0.0, 1.0]
	var percentage: float = smoothstep(-45.0, 45.0, angle)

	# number [0.0, 1.0] transformed to [0, -PI] radians
	phi = lerp(PI/2, -PI/2, percentage)

	# set y rotation angle
	direction.rotation.y = phi
	projectile.look_at(direction_mesh.global_position, Vector3.UP)
