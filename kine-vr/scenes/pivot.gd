extends Node3D

# angular speed for both axis in degrees
const ANGULAR_SPEED_THETA : float =  2 * PI 
const ANGULAR_SPEED_PHI : float = 2 * PI 

func _ready():
	pass

func _process(delta: float) -> void:
	
	# angle movement
	if Input.is_action_pressed("ui_up"):
		rotate_z(ANGULAR_SPEED_THETA * delta)
	elif Input.is_action_pressed("ui_down"):
		rotate_z(-ANGULAR_SPEED_THETA * delta)
	elif Input.is_action_pressed("ui_right"):
		rotate_y(ANGULAR_SPEED_THETA * delta)
	elif Input.is_action_pressed("ui_left"):
		rotate_y(-ANGULAR_SPEED_THETA * delta)
	
