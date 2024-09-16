extends Button


func _on_pressed() -> void:
	get_parent().option_pressed(self)
