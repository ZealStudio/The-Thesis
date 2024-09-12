extends Node


signal change_brightness



func brightness(value):
	emit_signal("change_brightness", value)
