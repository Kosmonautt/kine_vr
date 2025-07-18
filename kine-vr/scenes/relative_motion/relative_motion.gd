extends Node3D

var xr_interface: XRInterface

var control: TabContainer

@export var linear_speed: float = 1.0
@export var wagon: RigidBody3D
@export var projectile: RigidBody3D
@export var wheel_1: Node3D
@export var wheel_2: Node3D
@export var wheel_3: Node3D
@export var wheel_4: Node3D
@export var refresh_timer: Timer

# radius of the wheels
var radius: float = 0.125
var angular_speed: float = linear_speed / radius

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

	wagon.set_linear_velocity(Vector3(linear_speed, 0.0, 0.0))
	projectile.set_linear_velocity(Vector3(linear_speed, 0.0, 0.0))
	
	control = $ControlPad/Viewport2dIn3d.get_scene_instance()
	
	control.set_label_name("Scenery Reference System", 0)
	control.set_label_name("Wagon Reference System", 1)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	wheel_1.rotate_x(angular_speed * delta)
	wheel_2.rotate_x(angular_speed * delta)
	wheel_3.rotate_x(angular_speed * delta)
	wheel_4.rotate_x(angular_speed * delta)


func _on_scenery_body_entered(body: Node3D) -> void:
	if body == wagon:
		wagon.set_position(Vector3(1.5, 0.0, 3.0))


func _on_refresh_timer_timeout() -> void:
	control.refresh_screen(wagon.get_position() + projectile.get_position(), projectile.get_linear_velocity(), projectile.get_position(), projectile.get_linear_velocity() - wagon.get_linear_velocity())
	refresh_timer.start()
