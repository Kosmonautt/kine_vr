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

func _on_scenery_body_exited(body: Node3D) -> void:
	if body == self:
		position = respawn_position
		linear_velocity = Vector3.ZERO
		set_gravity_scale(0.0)
		can_launch = true
		# decals stop spawning
		timer.stop()


func _on_interactable_area_button_button_pressed(_button: Variant) -> void:
	if can_launch == true:
		set_gravity_scale(1.0)
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


func _on_target_timer_timeout() -> void:
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
	decal_xy.change_color(decal_color)
