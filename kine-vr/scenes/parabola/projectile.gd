extends RigidBody3D

const INITIAL_POSITION: Vector3 = Vector3(1.0, 1.0, 4.0)
const LAUNCH_SPEED: float = 20
# colors for decals
const sine_decal_color = Color(0, 1, 0)
const cosine_decal_color = Color(0, 0, 1)

@export var direction_mesh: Node3D
@export var decal_scene: PackedScene
@export var scenery: Area3D
@export var decal_timer: Timer
@export var time_elapsed_timer: Timer

var can_launch: bool = true
var paused: bool = false
var paused_linear_velocity: Vector3
var decal_list: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = INITIAL_POSITION
	set_gravity_scale(0.0)

func _on_scenery_body_exited(body: Node3D) -> void:
	if body == self:
		position = INITIAL_POSITION
		linear_velocity = Vector3.ZERO
		set_gravity_scale(0.0)
		can_launch = true
		# decals stop spawning
		decal_timer.stop()
		# time elapsed stops
		time_elapsed_timer.stop()


func _on_interactable_area_button_button_pressed(_button: Variant) -> void:
	if can_launch:
		set_gravity_scale(1.0)
		var launch_direction: Vector3 = direction_mesh.global_position - global_position
		linear_velocity = launch_direction.normalized() * LAUNCH_SPEED
		can_launch = false
		# if decal list is not empty
		if not decal_list.is_empty():
			# all decals are deleted
			for d in decal_list:
				d.queue_free()
			# list is emptied
			decal_list.clear()
		# decals start spawning
		decal_timer.start()
		# time elapsed starts
		time_elapsed_timer.start()


func _on_interactable_area_pause_button_released(button: Variant) -> void:
	if not paused:
		# linear velocity stored
		paused_linear_velocity = linear_velocity
		set_gravity_scale(0.0)
		linear_velocity = Vector3.ZERO
		# decal timer is stopped to avoid performance problems
		decal_timer.stop()
		# time elapsed stops
		time_elapsed_timer.stop()
	elif paused:
		# linear velocity given back
		linear_velocity = paused_linear_velocity
		set_gravity_scale(1.0)
		# decal timer is started again to decals spawn
		decal_timer.start()
		# time elapsed starts
		time_elapsed_timer.start()
		
	paused = not paused


func _on_timer_timeout() -> void:
	# decals are spawned
	var decal_xy = decal_scene.instantiate()
	var decal_yz = decal_scene.instantiate()
	# decal speed is set to 0
	decal_xy.speed = 0
	decal_yz.speed = 0
	# decal are added to the plane
	scenery.add_child(decal_xy)
	scenery.add_child(decal_yz)
	# the initial positions are set
	decal_xy.set_global_position(Vector3(get_global_position().x, get_global_position().y, scenery.get_global_position().z))
	decal_yz.set_global_position(Vector3(get_global_position().x, scenery.get_global_position().y, get_global_position().z))
	# add decal references to list
	decal_list.append(decal_xy)
	decal_list.append(decal_yz)
	# color change
	# sine decal
	decal_xy.change_color(sine_decal_color)
	# cosine decal
	decal_yz.change_color(cosine_decal_color)
