extends RigidBody3D

const INITIAL_POSITION: Vector3 = Vector3(0.0, 0.0, 3.0)

@export var direction_mesh: Node3D

var launch_speed: float = 10
var can_launch: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = INITIAL_POSITION
	set_gravity_scale(0.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass


func _on_scenery_body_exited(body: Node3D) -> void:
	if body == self:
		position = INITIAL_POSITION
		linear_velocity = Vector3.ZERO
		set_gravity_scale(0.0)
		can_launch = true


func _on_interactable_area_button_button_pressed(_button: Variant) -> void:
	if can_launch:
		set_gravity_scale(1.0)
		var launch_direction: Vector3 = direction_mesh.global_position - global_position
		linear_velocity = launch_direction.normalized() * launch_speed
		can_launch = false


func _on_interactable_slider_speed_slider_moved(p: Variant) -> void:
	# position [0.0, 0.4] meters to [0.0, 1.0]
	var percentage: float = smoothstep(0.0, 1.0, p)
	
	# number [0.0, 1.0] transformed to [10.0, 100.0] meters/s
	launch_speed = lerp(10.0, 100.0, percentage)
