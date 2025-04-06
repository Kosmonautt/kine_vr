extends Area3D

const DEFAULT_WIDTH = 20.0
const DEFAULT_HEIGHT = 8.0
const DEFAULT_DEPTH = 6.0

@export var wall: MeshInstance3D
@export var floor_n: MeshInstance3D
@export var collision: CollisionShape3D

var width: float = DEFAULT_WIDTH:
	get:
		return width
	set(value):
		size_vector.x = value
		set_size(size_vector.x, size_vector.y, size_vector.z)

var height: float = DEFAULT_HEIGHT:
	get:
		return height
	set(value):
		size_vector.y = value
		set_size(size_vector.x, size_vector.y, size_vector.z)
		
var depth: float = DEFAULT_DEPTH:
	get:
		return depth
	set(value):
		size_vector.z = value
		set_size(size_vector.x, size_vector.y, size_vector.z)
		
var size_vector := Vector3(DEFAULT_WIDTH, DEFAULT_HEIGHT, DEFAULT_DEPTH)
		
@onready var wall_mesh: PlaneMesh = wall.get_mesh()
@onready var floor_mesh: PlaneMesh = floor_n.get_mesh()
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
	floor_n.set_position(Vector3(w/2, 0, d/2))
	floor_mesh_material.set_uv1_scale(Vector3(w, d, 1))
	
	# collision change
	collision_box_shape.set_size(Vector3(w, h, d))
	collision.set_position(Vector3(w/2, h/2, d/2))
	

func _on_interactable_slider_y_slider_moved(p: Variant) -> void:
	# position [0.0, 0.5] meters to [0.0, 1.0]
	var percentage: float = smoothstep(0.0, 1.0, p)
	
	# number [0.0, 1.0] transformed to [8.0, 100.0] meters
	var h: float = lerp(8.0, 100.0, percentage)

	# set height
	height = h


func _on_interactable_slider_x_slider_moved(p: Variant) -> void:
	# position [0.0, 0.5] meters to [0.0, 1.0]
	var percentage: float = smoothstep(0.0, 1.0, p)

	# number [0.0, 1.0] transformed to [20.0, 100.0] meters
	var w: float = lerp(20.0, 100.0, percentage)

	# set width
	width = w


func _on_interactable_slider_z_slider_moved(p: Variant) -> void:
	# position [0.0, 0.5] meters to [0.0, 1.0]
	var percentage: float = smoothstep(0.0, 1.0, p)

	# number [0.0, 1.0] transformed to [6.0, 20.0] meters
	var d: float = lerp(6.0, 100.0, percentage)

	# set depth
	depth = d
