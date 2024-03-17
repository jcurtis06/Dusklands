extends CanvasModulate

signal on_night_time
signal on_day_time

@export var gradient: GradientTexture1D

var time: float = 0.0
var night = false

func _process(delta: float) -> void:
	time += delta * 0.5
	var value = (sin(time - PI / 2) + 1.0) / 2.0
	color = gradient.gradient.sample(value)
	
	if value < 0.5 && !night:
		on_night_time.emit()
		night = true
	
	if value > 0.5 && night:
		on_day_time.emit()
		night = false
