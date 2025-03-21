extends Node3D

# angular speed for both axis in degrees
const ANGULAR_SPEED_THETA : float =  2 * PI 
const ANGULAR_SPEED_PHI : float = 2 * PI 

var direction : Node3D

func _ready():
	direction = get_child(0)

func _process(delta: float) -> void:
	
	# angle movement
	if Input.is_action_pressed("ui_up"):
		direction.rotate_z(ANGULAR_SPEED_THETA * delta)
	elif Input.is_action_pressed("ui_down"):
		direction.rotate_z(-ANGULAR_SPEED_THETA * delta)
	elif Input.is_action_pressed("ui_right"):
		rotate_y(ANGULAR_SPEED_THETA * delta)
	elif Input.is_action_pressed("ui_left"):
		rotate_y(-ANGULAR_SPEED_THETA * delta)
