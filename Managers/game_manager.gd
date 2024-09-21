extends Node


signal change_brightness

signal dialog_initiated
signal dialog_finished

#menu is inventory ?
enum GameState {FREEWALK, IN_MENU, IN_DIALOG}


func brightness(value):
	emit_signal("change_brightness", value)


func emit_dialog_initiated(complete_interaction: CompleteInteraction):
	call_deferred("emit_signal", "dialog_initiated", complete_interaction)


func emit_dialog_finished():
	call_deferred("emit_signal", "dialog_finished")
