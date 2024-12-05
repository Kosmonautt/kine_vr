extends RigidBody3D

const initial_position: Vector3 = Vector3(-4, 1, 0)
const intiial_velocity: Vector3 = Vector3(5, 5, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	position = initial_position
	linear_velocity = intiial_velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_parabola_body_exited(_body):
	position = initial_position
	linear_velocity = intiial_velocity
