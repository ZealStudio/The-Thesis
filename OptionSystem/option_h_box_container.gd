extends HBoxContainer



func _on_option_1_pressed() -> void:
	StoryManager.throw_egg = true


func _on_option_2_pressed() -> void:
	StoryManager.throw_egg = false
