extends Node3D


func _on_interactable_area_button_button_pressed(button: Variant) -> void:
	print("pressed")


func _on_interactable_area_button_button_released(button: Variant) -> void:
	print("released")
