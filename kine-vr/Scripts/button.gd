extends Node3D

signal input_chosen(mode: String)

@export var mode: String

func _on_interactable_area_button_button_pressed(button: Variant) -> void:
	input_chosen.emit(mode)


func _on_interactable_area_button_button_released(button: Variant) -> void:
	input_chosen.emit(mode)
