extends Node3D

signal buttons_state_changed(state: Dictionary)

var buttons_state: Dictionary = {
	"theta_up": false,
	"theta_down": false,
	"phi_left": false,
	"phi_right": false,
	"launch": false
}


func _on_theta_up_input_selected() -> void:
	buttons_state["theta_up"] = true
	buttons_state_changed.emit(buttons_state)


func _on_theta_down_input_selected() -> void:
	buttons_state["theta_down"] = true
	buttons_state_changed.emit(buttons_state)


func _on_phi_left_input_selected() -> void:
	buttons_state["phi_left"] = true
	buttons_state_changed.emit(buttons_state)


func _on_phi_right_input_selected() -> void:
	buttons_state["phi_right"] = true
	buttons_state_changed.emit(buttons_state)

func _on_launch_input_selected() -> void:
	buttons_state["launch"] = true
	buttons_state_changed.emit(buttons_state)


func _on_theta_up_input_deselected() -> void:
	buttons_state["theta_up"] = false
	buttons_state_changed.emit(buttons_state)


func _on_theta_down_input_deselected() -> void:
	buttons_state["theta_down"] = false
	buttons_state_changed.emit(buttons_state)


func _on_phi_left_input_deselected() -> void:
	buttons_state["phi_left"] = false
	buttons_state_changed.emit(buttons_state)


func _on_phi_right_input_deselected() -> void:
	buttons_state["phi_right"] = false
	buttons_state_changed.emit(buttons_state)


func _on_launch_input_deselected() -> void:
	buttons_state["launch"] = false
	buttons_state_changed.emit(buttons_state)
