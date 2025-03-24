extends Node3D

@export var projectile: Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	position = Vector3(projectile.position.x, projectile.position.y, -2)
