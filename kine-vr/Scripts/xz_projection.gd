extends Node3D

var projectile: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	projectile = get_parent().get_child(4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position = Vector3(projectile.position.x, 0, projectile.position.z)
