extends Node3D

var parent: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	global_position = Vector3(parent.position.x, 0, parent.position.z)
