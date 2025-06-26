extends TabContainer

var num: float = 0.0

func _ready() -> void:
	$Data/VBoxContainer/ThetaAngle/Value.text = "%8.3f" % [num]

#func _on_refresh_timer_timeout() -> void:
	#num += 0.1
	#$Data/VBoxContainer/ThetaAngle/Value.text = "%8.3f" % [num]

func refresh_screen(angle: float) -> void:
	$Data/VBoxContainer/ThetaAngle/Value.text = "%8.3f" % [angle]
	
