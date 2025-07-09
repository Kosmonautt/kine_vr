extends Node3D

var xr_interface: XRInterface

var control: TabContainer

@export var projectile: RigidBody3D
@export var target: RigidBody3D
@export var pivot: Node3D
@export var refresh_timer: Timer
@export var time_elapsed_timer: Timer

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
	control.set_label_name("Projectile", 0)
	control.set_label_name("Target", 1)
	
func _on_projectile_refresh_timer_timeout() -> void:
	control.refresh_screen(projectile, target, pivot.theta, pivot.radius, projectile.launch_speed, time_elapsed_timer.get_wait_time() - time_elapsed_timer.get_time_left(), projectile.paused or target.paused)
	refresh_timer.start()
