extends Node3D

@export var projectile: Node3D
@export var mode: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
		
	# Moves the projection to the projectile position
	if mode == "XY":
		position.x = projectile.position.x
		position.y = projectile.position.y
	elif mode == "YZ":
		position.y = projectile.position.y
		position.z = projectile.position.z
	elif mode == "ZX":
		position.x = projectile.position.x
		position.z = projectile.position.z
