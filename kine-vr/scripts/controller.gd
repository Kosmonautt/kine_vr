extends Node3D

var buttons_state: Dictionary = {
	"theta_up": false,
	"theta_down": false,
	"phi_up": false,
	"phi_down": false,
	"launch": false
}


func _on_theta_up_input_selected() -> void:
	buttons_state["theta_up"] = true


func _on_theta_down_input_selected() -> void:
	buttons_state["theta_down"] = true


func _on_phi_left_input_selected() -> void:
	buttons_state["phi_left"] = true


func _on_phi_right_input_selected() -> void:
	buttons_state["phi_right"] = true


func _on_launch_input_selected() -> void:
	buttons_state["launch"] = true


func _on_theta_up_input_deselected() -> void:
	buttons_state["theta_up"] = false


func _on_theta_down_input_deselected() -> void:
	buttons_state["theta_down"] = false


func _on_phi_left_input_deselected() -> void:
	buttons_state["phi_left"] = false


func _on_phi_right_input_deselected() -> void:
	buttons_state["phi_right"] = false


func _on_launch_input_deselected() -> void:
	buttons_state["launch"] = false
