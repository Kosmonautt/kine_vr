extends RigidBody3D

const speed: int = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = Vector3(speed, speed, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_parabola_body_exited(_body):
	print("exited")
