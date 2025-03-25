extends Node3D

signal launch_button_pressed(launch_direction: Vector3)

# angular speed for both axis in degrees
const ANGULAR_SPEED_THETA: float =  PI 
const ANGULAR_SPEED_PHI: float = PI 

@export var direction: Node3D
@export var direction_mesh: Node3D
@export var projectile: Node3D

var theta_up: bool = false
var theta_down: bool = false
var phi_left: bool = false
var phi_right: bool = false
var launch: bool = false

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	
	# angle movement
	if Input.is_action_pressed("ui_up") or theta_up:
		direction.rotate_z(ANGULAR_SPEED_THETA * delta)
		projectile.look_at(direction_mesh.global_position, Vector3.UP)
	elif Input.is_action_pressed("ui_down") or theta_down:
		direction.rotate_z(-ANGULAR_SPEED_THETA * delta)
		projectile.look_at(direction_mesh.global_position, Vector3.UP)
	elif Input.is_action_pressed("ui_right") or phi_right:
		rotate_y(-ANGULAR_SPEED_THETA * delta)
		projectile.look_at(direction_mesh.global_position, Vector3.UP)
	elif Input.is_action_pressed("ui_left") or phi_left:
		rotate_y(ANGULAR_SPEED_THETA * delta)
		projectile.look_at(direction_mesh.global_position, Vector3.UP)
	
	if Input.is_action_just_pressed("ui_accept") or launch:
		launch_button_pressed.emit(direction_mesh.global_position)
		launch = false


func _on_theta_up_input_selected(mode: String) -> void:
	theta_up = true


func _on_theta_down_input_selected(mode: String) -> void:
	theta_down = true


func _on_phi_left_input_selected(mode: String) -> void:
	phi_left = true


func _on_phi_r_ight_input_selected(mode: String) -> void:
	phi_right = true


func _on_launch_input_selected(mode: String) -> void:
	launch = true


func _on_theta_up_input_deselected(mode: String) -> void:
	theta_up = false


func _on_theta_down_input_deselected(mode: String) -> void:
	theta_down = false


func _on_phi_left_input_deselected(mode: String) -> void:
	phi_left = false


func _on_phi_r_ight_input_deselected(mode: String) -> void:
	phi_right = false


func _on_launch_input_deselected(mode: String) -> void:
	launch = false
