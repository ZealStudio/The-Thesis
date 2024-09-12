extends Control

@export var forward_button: Button
@export var backward_button: Button

var set_forward: bool = false
var set_backward: bool = false


func _on_forward_button_pressed() -> void:
	InputMap.action_erase_events("move_forward")
	forward_button.text = ""
	set_forward = true


func _on_backward_button_pressed() -> void:
	InputMap.action_erase_events("move_backward")
	backward_button.text = ""
	set_backward = true


func _input(event: InputEvent) -> void:
	if !event is InputEventMouse and check_taken_events(event):
		if set_forward:
			InputMap.action_add_event("move_forward", event)
			forward_button.text = event.as_text()
			set_forward = false
		if set_backward:
			InputMap.action_add_event("move_backward", event)
			backward_button.text = event.as_text()
			set_backward = false
	if event.is_action_pressed("move_backward"):
		print("hello")

func check_taken_events(event):
	return !InputMap.event_is_action(event, "move_forward") and\
	!InputMap.event_is_action(event, "move_backward")
