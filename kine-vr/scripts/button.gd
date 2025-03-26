extends Node3D

signal input_selected(mode: String)
signal input_deselected(mode: String)

@export var mode: String

func _ready() -> void:
	var button_material: StandardMaterial3D = $pulsor.get_active_material(0)

func _on_interactable_area_button_button_pressed(button: Variant) -> void:
	input_selected.emit(mode)


func _on_interactable_area_button_button_released(button: Variant) -> void:
	input_deselected.emit(mode)
