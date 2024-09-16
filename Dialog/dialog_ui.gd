extends Control

@export var current_interaction_tres: CompleteInteraction
@export var current_dialogue_tres: Dialogue
@export var text_bg: ColorRect
@export var avatar: TextureRect
@export var dialogue_text: Label
@export var runtime_data: RuntimeData
@export var button_container: HBoxContainer

@export var test_interaction: CompleteInteraction

var option_button_preload: PackedScene = preload("res://Dialog/option_button.tscn")

var current_dialog_index: int
var current_slide_index: int = 0
var options_shown: bool = false
func _ready():
	#avatar.texture = current_dialogue_tres.avatar_texture

	GameManager.connect("dialog_initiated", on_dialog_initiated)
	GameManager.connect("dialog_finished", on_dialog_finished)
	#for dialog testing, manual insert
	GameManager.emit_dialog_initiated(test_interaction)

func _input(event):
	if event.is_action_pressed("interact"):
		if current_slide_index < current_dialogue_tres.dialog_slides.size() - 1:
			current_slide_index += 1
			show_slide()
		elif runtime_data.current_gameplay_state == GameManager.GameState.IN_DIALOG and\
		current_dialogue_tres.options.size() > 0:
			show_options()
		elif runtime_data.current_gameplay_state == GameManager.GameState.IN_DIALOG:
			GameManager.emit_dialog_finished()


func show_slide():
	dialogue_text.text = current_dialogue_tres.dialog_slides[current_slide_index]
	if current_slide_index == 0:
		avatar.texture = current_dialogue_tres.avatars[current_slide_index]

func show_options():
	if not options_shown:
		text_bg.visible = false
		for i in current_dialogue_tres.options.size():
			var new_button = option_button_preload.instantiate()
			#if complicated unique buttons:
			#add a .initialize() instead and add values in the button script instead of here
			new_button.text = current_dialogue_tres.options[i]
			new_button.name = current_dialogue_tres.option_titles[i]
			button_container.add_child(new_button)
			options_shown = true


func on_dialog_finished():
	runtime_data.current_gameplay_state = GameManager.GameState.FREEWALK
	options_shown = false
	self.visible = false


func on_dialog_initiated(complete_interaction: CompleteInteraction):
	runtime_data.current_gameplay_state = GameManager.GameState.IN_DIALOG
	current_interaction_tres = complete_interaction
	current_dialog_index = current_interaction_tres.index
	current_dialogue_tres = current_interaction_tres.dialog_array[current_dialog_index]
	current_slide_index = 0
	show_slide()
	self.visible = true
