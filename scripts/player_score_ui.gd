extends Control

class_name PlayerScoreUI

@onready var score_label : Label = $score

func update(score) -> void:
	score_label.text = str(score)
