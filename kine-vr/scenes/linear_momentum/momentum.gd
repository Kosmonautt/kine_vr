extends Node3D


var xr_interface: XRInterface

var control: TabContainer
var left_initial_velocity_x: float = 0.0
var right_initial_velocity_x: float = 0.0
var paused: bool = false
var left_paused_linear_velocity: Vector3
var right_paused_linear_velocity: Vector3

@export var projectile_left: RigidBody3D
@export var projectile_right: RigidBody3D
@export var refresh_timer: Timer
@export var time_elapsed_timer: Timer

const projectile_left_initial_position: Vector3 = Vector3(1.0, 2.5, 1.5)
const projectile_right_initial_position: Vector3 = Vector3(13.0, 2.5, 1.5)

func _ready() -> void:
	Engine.max_fps = 90
	
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")

		# Turn off v-sync!
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

		# Change our main viewport to output to the HMD
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized, please check if your headset is connected")

	control = $Interface/ControlPad/Viewport2dIn3d.get_scene_instance()
	control.set_label_name("Left Projectile", 0)
	control.set_label_name("Right Projectile", 1)


func _on_scenery_body_exited(body: Node3D) -> void:
	if (body == projectile_left) or (body == projectile_right):
		projectile_left.set_linear_velocity(Vector3.ZERO)
		projectile_left.set_position(projectile_left_initial_position)
		projectile_right.set_linear_velocity(Vector3.ZERO)
		projectile_right.set_position(projectile_right_initial_position)
		# time elapsed stops
		time_elapsed_timer.stop()


func _on_interactable_mass_left_slider_moved(position: Variant) -> void:
	# position [0.0, 0.2] meters to [0.0, 1.0]
	var percentage: float = smoothstep(0.0, 0.2, position)
	
	# number [0.0, 1.0] transformed to [1.0, 20.0] kg
	projectile_left.set_mass(lerp(1.0, 20.0, percentage))


func _on_interactable_mass_right_slider_moved(position: Variant) -> void:
	# position [0.0, 0.2] meters to [0.0, 1.0]
	var percentage: float = smoothstep(0.0, 0.2, position)
	
	# number [0.0, 1.0] transformed to [1.0, 20.0] kg
	projectile_right.set_mass(lerp(1.0, 20.0, percentage))


func _on_interactable_velocity_left_slider_moved(position: Variant) -> void:
	# position [0.0, 0.2] meters to [0.0, 1.0]
	var percentage: float = smoothstep(0.0, 0.2, position)
	
	# number [0.0, 1.0] transformed to [-20.0, 20.0] m/s
	left_initial_velocity_x = lerp(-20.0, 20.0, percentage)


func _on_interactable_velocity_right_slider_moved(position: Variant) -> void:
	# position [0.0, 0.2] meters to [0.0, 1.0]
	var percentage: float = smoothstep(0.0, 0.2, position)
	
	# number [0.0, 1.0] transformed to [-20.0, 20.0] m/s
	right_initial_velocity_x = lerp(-20.0, 20.0, percentage)


func _on_interactable_area_button_button_pressed(button: Variant) -> void:
	# set velocities for both projectiles
	projectile_left.set_linear_velocity(Vector3(left_initial_velocity_x, 0.0, 0.0))
	projectile_right.set_linear_velocity(Vector3(right_initial_velocity_x, 0.0, 0.0))
	# time elapsed starts
	time_elapsed_timer.start()


func _on_interactable_area_pause_button_released(button: Variant) -> void:
	if not paused:
		# linear velocity stored
		left_paused_linear_velocity = projectile_left.get_linear_velocity()
		right_paused_linear_velocity = projectile_right.get_linear_velocity()
		projectile_left.set_linear_velocity(Vector3.ZERO)
		projectile_right.set_linear_velocity(Vector3.ZERO)
		# time elapsed stops
		time_elapsed_timer.stop()
	elif paused:
		# linear velocity given back
		projectile_left.set_linear_velocity(left_paused_linear_velocity)
		projectile_right.set_linear_velocity(right_paused_linear_velocity)
		# time elapsed starts
		time_elapsed_timer.start()
	
	paused = not paused


func _on_refresh_timer_timeout() -> void:
	control.refresh_screen(projectile_left, projectile_right, left_initial_velocity_x, right_initial_velocity_x, time_elapsed_timer.get_wait_time() - time_elapsed_timer.get_time_left(), paused)
	refresh_timer.start()
