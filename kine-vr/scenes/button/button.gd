extends Node3D

signal input_selected()
signal input_deselected()

#@export var button_color: Color
#
#func _ready() -> void:
	#var button_material: StandardMaterial3D = $pulsor.get_active_material(0)


func _on_interactable_area_button_button_pressed(_button: Variant) -> void:
	input_selected.emit()


func _on_interactable_area_button_button_released(_button: Variant) -> void:
	input_deselected.emit()
