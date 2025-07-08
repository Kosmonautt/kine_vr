extends Node3D

@export var linear_speed: float = 1.0
@export var map: RigidBody3D
@export var wheel_1: Node3D
@export var wheel_2: Node3D
@export var wheel_3: Node3D
@export var wheel_4: Node3D

# radius of the wheels
var radius: float = 0.125
var angular_speed: float = linear_speed / radius

var xr_interface: XRInterface

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
	
	map.set_linear_velocity(Vector3(0.0, 0.0, -linear_speed))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	wheel_1.rotate_x(angular_speed * delta)
	wheel_2.rotate_x(angular_speed * delta)
	wheel_3.rotate_x(angular_speed * delta)
	wheel_4.rotate_x(angular_speed * delta)
