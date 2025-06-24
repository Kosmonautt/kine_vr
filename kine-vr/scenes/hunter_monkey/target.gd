extends RigidBody3D

const INITIAL_POSITION: Vector3 = Vector3(16.0, 4.0, 3.0)
const decal_color: Color = Color(0, 0, 1)

@export var decal_scene: PackedScene
@export var scenery: Area3D
@export var timer: Timer

var can_launch: bool = true
var respawn_position: Vector3 = INITIAL_POSITION
var decal_list: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = INITIAL_POSITION
	set_gravity_scale(0.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass


func _on_scenery_body_exited(body: Node3D) -> void:
	if body == self:
		position = respawn_position
		linear_velocity = Vector3.ZERO
		set_gravity_scale(0.0)
		can_launch = true


func _on_interactable_area_button_button_pressed(_button: Variant) -> void:
	if can_launch == true:
		set_gravity_scale(1.0)
		can_launch = false
