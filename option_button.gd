extends Button

var index: int


func _on_pressed() -> void:
	if get_parent().get_parent().name == "DialogUI":
		get_parent().get_parent().option_pressed(self)
	else:
		print_debug("Button sending signal to wrong Node.")
