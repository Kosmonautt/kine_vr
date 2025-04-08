extends Node3D

@export var angular_speed: float = PI
@export var radius: float = 1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	rotate_z(-angular_speed * delta)
