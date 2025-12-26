extends Control

class_name PlayerHealthUI

@onready var health_label : Label = $health
@onready var vie1 : TextureRect = $HBoxContainer/TextureRect
@onready var vie2 : TextureRect = $HBoxContainer/TextureRect2
@onready var vie3 : TextureRect = $HBoxContainer/TextureRect3

func update(health) -> void:
	if health == 2:
		vie3.visible = false
	if health == 1:
		vie2.visible = false
	if health == 0:
		vie1.visible = false
