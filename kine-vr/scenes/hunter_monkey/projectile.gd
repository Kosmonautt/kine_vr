extends RigidBody3D

const INITIAL_POSITION: Vector3 = Vector3(0.0, 0.0, 3.0)

@export var direction_mesh: Node3D
@export var decal_scene: PackedScene
@export var scenery: Area3D
@export var timer: Timer

var launch_speed: float = 10
var can_launch: bool = true
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
		position = INITIAL_POSITION
		linear_velocity = Vector3.ZERO
		set_gravity_scale(0.0)
		can_launch = true
		# decals stop spawning
		timer.stop()


func _on_interactable_area_button_button_pressed(_button: Variant) -> void:
	if can_launch:
		set_gravity_scale(1.0)
		var launch_direction: Vector3 = direction_mesh.global_position - global_position
		linear_velocity = launch_direction.normalized() * launch_speed
		can_launch = false
		# if decal list is not empty
		if not decal_list.is_empty():
			# all decals are deleted
			for d in decal_list:
				d.queue_free()
			# list is emptied
			decal_list.clear()
		# decals start spawning
		timer.start()


func _on_interactable_slider_speed_slider_moved(p: Variant) -> void:
	# position [0.0, 0.4] meters to [0.0, 1.0]
	var percentage: float = smoothstep(0.0, 1.0, p)
	
	# number [0.0, 1.0] transformed to [10.0, 100.0] meters/s
	launch_speed = lerp(10.0, 100.0, percentage)


func _on_timer_timeout() -> void:
	# decals are spawned
	var decal_xy = decal_scene.instantiate()
	# decal speed is set to 0
	decal_xy.speed = 0
	# decal are added to the plane
	scenery.add_child(decal_xy)
	# the initial positions are set
	decal_xy.set_global_position(Vector3(get_global_position().x, get_global_position().y, scenery.get_global_position().z))
	# add decal references to list
	decal_list.append(decal_xy)
	# color change
	## decal color
	#decal_xy.change_color(sine_decal_color)
