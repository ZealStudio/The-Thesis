extends Node

#var throw_egg: bool = false

#enum {Fought, Ran, Watched}


##only use this for key decisions
##for simple interactions that have no
##effect of other factors handle it locally
var story_dict: Dictionary = {
	"throws_egg" = false,
	"throws_chair" = false
}


func check_story_dictionary(option_title):
	print(option_title)
	if story_dict.has(option_title):
		print(story_dict[option_title])
		story_dict[option_title] = true
		print(story_dict[option_title])
	
