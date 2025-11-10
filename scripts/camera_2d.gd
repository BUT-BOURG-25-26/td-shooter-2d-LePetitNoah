extends Camera2D

class_name Camera

@export var duration := 0.3
@export var magnitude := 8.0

var original_offset := Vector2.ZERO

func shake():
	original_offset = offset
	var tween = create_tween()
	for i in range(10):
		tween.tween_property(self, "offset",
			original_offset + Vector2(randf_range(-magnitude, magnitude), randf_range(-magnitude, magnitude)),
			duration / 10)
	tween.tween_property(self, "offset", original_offset, duration / 10)
