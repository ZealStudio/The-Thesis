extends ColorRect

func _ready():
	GameManager.connect("change_brightness", change_brightness)


func change_brightness(value):
	modulate.r = value / 100
	modulate.g = value / 100
	modulate.b = value / 100
	
