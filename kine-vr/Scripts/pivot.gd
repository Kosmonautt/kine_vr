extends Node3D

# angular speed for both axis in degrees
const ANGULAR_SPEED_THETA: float =  2 * PI 
const ANGULAR_SPEED_PHI: float = 2 * PI 

@export var direction: Node3D
@export var direction_mesh: Node3D
@export var projectile: Node3D

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	
	# angle movement
	if Input.is_action_pressed("ui_up"):
		direction.rotate_z(ANGULAR_SPEED_THETA * delta)
		projectile.look_at(direction_mesh.global_position, Vector3.UP)
	elif Input.is_action_pressed("ui_down"):
		direction.rotate_z(-ANGULAR_SPEED_THETA * delta)
		projectile.look_at(direction_mesh.global_position, Vector3.UP)
	elif Input.is_action_pressed("ui_right"):
		rotate_y(ANGULAR_SPEED_THETA * delta)
		projectile.look_at(direction_mesh.global_position, Vector3.UP)
	elif Input.is_action_pressed("ui_left"):
		rotate_y(-ANGULAR_SPEED_THETA * delta)
		projectile.look_at(direction_mesh.global_position, Vector3.UP)
	
	if Input.is_action_just_pressed("ui_accept"):
		projectile.launch(direction_mesh.global_position)
