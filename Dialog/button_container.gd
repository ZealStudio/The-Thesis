extends HBoxContainer


func option_pressed(option: Button):
	StoryManager.check_story_dictionary(option.name)
	await get_tree().create_timer(2).timeout
	GameManager.emit_dialog_finished()
