extends Area3D

const DEFAULT_WIDTH = 20.0
const DEFAULT_HEIGHT = 8.0
const DEFAULT_DEPTH = 6.0

@export var wall: MeshInstance3D
@export var floor: MeshInstance3D
@export var collision: CollisionShape3D

@export_range(1.0, 100.0, 0.1) var width: float = DEFAULT_WIDTH:
	get:
		return width
	set(value):
		size_vector.x = value
		set_size(size_vector.x, size_vector.y, size_vector.z)

@export_range(1.0, 100.0, 0.1) var height: float = DEFAULT_HEIGHT:
	get:
		return height
	set(value):
		size_vector.y = value
		set_size(size_vector.x, size_vector.y, size_vector.z)
		
@export_range(1.0, 20.0, 0.1) var depth: float = DEFAULT_DEPTH:
	get:
		return depth
	set(value):
		size_vector.z = value
		set_size(size_vector.x, size_vector.y, size_vector.z)
		
var size_vector := Vector3(DEFAULT_WIDTH, DEFAULT_HEIGHT, DEFAULT_DEPTH)
		
@onready var wall_mesh: PlaneMesh = wall.get_mesh()
@onready var floor_mesh: PlaneMesh = floor.get_mesh()
@onready var collision_box_shape: BoxShape3D = collision.get_shape()
@onready var wall_mesh_material: StandardMaterial3D = wall_mesh.get_material()
@onready var floor_mesh_material: StandardMaterial3D = floor_mesh.get_material()


func set_size(w: float, h: float, d: float) -> void:
	# wall change
	wall_mesh.set_size(Vector2(w, h))
	wall.set_position(Vector3(w/2, h/2, 0))
	wall_mesh_material.set_uv1_scale(Vector3(w, h, 1))
	wall_mesh_material.set_uv1_offset(Vector3(0, -h, 0))

	# floor change
	floor_mesh.set_size(Vector2(w, d))
	floor.set_position(Vector3(w/2, 0, d/2))
	floor_mesh_material.set_uv1_scale(Vector3(w, d, 1))
	
	# collision change
	collision_box_shape.set_size(Vector3(w, h, d))
	collision.set_position(Vector3(w/2, h/2, d/2))
	
