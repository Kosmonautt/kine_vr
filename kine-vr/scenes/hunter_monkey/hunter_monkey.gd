extends Node3D

var xr_interface: XRInterface

var projectile_control: TabContainer
var target_control: TabContainer

@export var projectile: RigidBody3D
@export var target: RigidBody3D
@export var projectile_refresh_timer: Timer
@export var target_refresh_timer: Timer

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
	
	projectile_control = $ControlPadProjectile/Viewport2dIn3d.get_scene_instance()
	projectile_control.set_label_name("Projectile")
	
	target_control = $ControlPadTarget/Viewport2dIn3d.get_scene_instance()
	target_control.set_label_name("Target")
	
	
func _on_projectile_refresh_timer_timeout() -> void:
	projectile_control.refresh_screen(projectile)
	projectile_refresh_timer.start()


func _on_target_refresh_timer_timeout() -> void:
	target_control.refresh_screen(target)
	target_refresh_timer.start()
