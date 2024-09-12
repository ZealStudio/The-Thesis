extends TextureButton


@export var options_menu: Control

func _on_pressed() -> void:
	options_menu.visible = true
