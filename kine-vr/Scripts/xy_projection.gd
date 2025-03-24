extends Node3D

var projectile: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	projectile = get_parent().get_child(4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	position = Vector3(projectile.position.x, projectile.position.y, -2)
