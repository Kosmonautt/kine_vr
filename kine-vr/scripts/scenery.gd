extends Area3D

const DEFAULT_WIDTH = 20.0
const DEFAULT_HEIGHT = 8.0
const DEFAULT_DEPTH = 6.0

@export var wall: MeshInstance3D
@export var floor: MeshInstance3D
@export var collision: CollisionShape3D

@export_range(1.0, 100.0) var width: float = DEFAULT_WIDTH:
	get:
		return width
	set(value):
		set_size(value, height, depth)

@export_range(1.0, 100.0) var height: float = DEFAULT_HEIGHT:
	get:
		return height
	set(value):
		set_size(width, value, depth)
		
@export_range(1.0, 100.0) var depth: float = DEFAULT_DEPTH:
	get:
		return depth
	set(value):
		set_size(width, height, value)
		
@onready var wall_mesh: PlaneMesh = wall.get_mesh()
@onready var floor_mesh: PlaneMesh = floor.get_mesh()
@onready var collision_box_shape: BoxShape3D = collision.get_shape()


func set_size(width: float, height: float, depth: float) -> void:
	# wall change
	wall_mesh.set_size(Vector2(width, height))
	wall.set_position(Vector3(width/2, height/2, 0))
	
	# floor change
	floor_mesh.set_size(Vector2(width, depth))
	floor.set_position(Vector3(width/2, 0, depth/2))
	
	# collision change
	collision_box_shape.set_size(Vector3(width, height, depth))
	collision.set_position(Vector3(width/2, height/2, depth/2))
	
