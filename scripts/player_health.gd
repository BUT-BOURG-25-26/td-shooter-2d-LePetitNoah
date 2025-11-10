extends Control

class_name PlayerHealthUI

@onready var health_label : Label = $health

func update(health) -> void:
	health_label.text = "x" + str(health)
