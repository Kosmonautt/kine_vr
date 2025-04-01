extends Node3D

signal launch_button_pressed(launch_direction: Vector3)

# angular speed for both axis in degrees
const ANGULAR_SPEED_THETA: float =  PI 
const ANGULAR_SPEED_PHI: float = PI 

@export var direction: Node3D
@export var direction_mesh: Node3D
@export var projectile: Node3D

var buttons_state: Dictionary = {
	"theta_up": false,
	"theta_down": false,
	"phi_left": false,
	"phi_right": false,
	"launch": false
}

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	
	# angle movement
	if Input.is_action_pressed("ui_up") or buttons_state["theta_up"]:
		direction.rotate_z(ANGULAR_SPEED_THETA * delta)
		projectile.look_at(direction_mesh.global_position, Vector3.UP)
	elif Input.is_action_pressed("ui_down") or buttons_state["theta_down"]:
		direction.rotate_z(-ANGULAR_SPEED_THETA * delta)
		projectile.look_at(direction_mesh.global_position, Vector3.UP)
	elif Input.is_action_pressed("ui_right") or buttons_state["phi_right"]:
		rotate_y(-ANGULAR_SPEED_THETA * delta)
		projectile.look_at(direction_mesh.global_position, Vector3.UP)
	elif Input.is_action_pressed("ui_left") or buttons_state["phi_left"]:
		rotate_y(ANGULAR_SPEED_THETA * delta)
		projectile.look_at(direction_mesh.global_position, Vector3.UP)
	
	if Input.is_action_just_pressed("ui_accept") or buttons_state["launch"]:
		launch_button_pressed.emit(direction_mesh.global_position)
		buttons_state["launch"] = false


func _on_interactable_lever_theta_hinge_moved(angle: Variant) -> void:
	# angle [-45, 45] degrees to [0.0, 1.0]
	var percentage: float = smoothstep(45.0, -45.0, angle)
	
	# number [0.0, 1.0] transformed to [-PI/2, PI/2] radians
	var theta: float = lerp(-PI/2, PI/2, percentage)
	
	# set z rotation angle
	direction.rotation.z = theta
	projectile.look_at(direction_mesh.global_position, Vector3.UP)


func _on_interactable_lever_phi_hinge_moved(angle: Variant) -> void:
	# angle [-45, 45] degrees to [0.0, 1.0]
	var percentage: float = smoothstep(-45.0, 45.0, angle)

	# number [0.0, 1.0] transformed to [0, -PI] radians
	var phi: float = lerp(PI/2, -PI/2, percentage)

	# set y rotation angle
	direction.rotation.y = phi
	projectile.look_at(direction_mesh.global_position, Vector3.UP)


func _on_interactable_area_button_button_pressed(button: Variant) -> void:
	launch_button_pressed.emit(direction_mesh.global_position)
