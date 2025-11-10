extends Control

class_name GameOverUI

@onready var restart_button : Button = $restart
@onready var quit_button : Button = $quit

func _ready() -> void:
	restart_button.pressed.connect(GameManager.restart)
	quit_button.pressed.connect(GameManager.quit)
