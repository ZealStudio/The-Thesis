extends Node

signal change_volume


func volume(value):
	emit_signal("change_volume", value)
