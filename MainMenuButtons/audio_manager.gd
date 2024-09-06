extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.connect("change_volume", change_volume)


func change_volume(value):
	var volume = (value - 99) / 5
	set_deferred("volume_db", volume)
