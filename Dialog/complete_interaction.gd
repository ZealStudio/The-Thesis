extends Resource
class_name CompleteInteraction

#initial dialog

#options

#dialog branches to more

#options from that branch

#contain all forms of branches in CompleteInteraction?

#only tell the options in dialogue the index they need to go to then pop back here
#to play the next one

#dialog example:

#intro text
#any other forms of text
#if an option
#present option
#based on evaluation of option tell CompleteInteraction which then play next

#play that intro text
#probably a response rather than intro but same thing
#if an option
#present option
#based on evaluation of option tell CompleteInteraction which then play next


@export var index: int = 0

@export var dialog_array: Array[Dialogue]
