extends Node


signal change_brightness
signal change_volume


func brightness(value):
	emit_signal("change_brightness", value)


func volume(value):
	emit_signal("change_volume", value)
