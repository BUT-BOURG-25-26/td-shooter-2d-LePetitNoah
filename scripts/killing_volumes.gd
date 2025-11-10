extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area is Bullet:
		area.queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.queue_free()
