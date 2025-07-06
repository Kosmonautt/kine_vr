extends Node3D

@export var projectile1: RigidBody3D
@export var projectile2: RigidBody3D

var xr_interface: XRInterface

const projectile1_initial_position: Vector3 = Vector3(1.0, 2.5, 1.5)
const projectile2_initial_position: Vector3 = Vector3(13.0, 2.5, 1.5)

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

func _physics_process(delta: float) -> void:
	var message_format: String = "p1 momentum: %f  p2 momentum: %f total momentum: %f p1 Ee: %f"
	var energy_format: String = "KE: %f, PE: %f, E: %f"
	var p1momentum: float = projectile1.get_mass() * projectile1.get_linear_velocity().x
	var p2momentum: float = projectile2.get_mass() * projectile2.get_linear_velocity().x
	var p1ke: float = (projectile1.get_mass() * pow(projectile1.linear_velocity.length(), 2) )/2
	var p2ke: float = (projectile2.get_mass() * pow(projectile2.linear_velocity.length(), 2) )/2
	var p1gpe: float = projectile1.get_mass() * 9.8 * (projectile1.get_position().y - 0.5) 
	var p2gpe: float = projectile2.get_mass() * 9.8 * (projectile2.get_position().y - 0.5)
	var message: String = message_format % [p1momentum, p2momentum, p1momentum + p2momentum, p1ke + p1gpe]
	var energy_message: String = energy_format % [p1ke, p1gpe, p1ke + p1gpe]
	
	#print(message)
	#print(energy_message)


func _on_scenery_body_exited(body: Node3D) -> void:
	if body == projectile1:
		projectile1.set_linear_velocity(Vector3.ZERO)
		projectile1.set_position(projectile1_initial_position)
	elif body == projectile2:
		projectile2.set_linear_velocity(Vector3.ZERO)
		projectile2.set_position(projectile2_initial_position)
