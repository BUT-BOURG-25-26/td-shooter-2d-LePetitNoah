extends Node

var origin_node : Node2D
var player : Player
var camera : Camera

var score : int = 0

var player_health_ui : PlayerHealthUI
var player_score_ui : PlayerScoreUI
var game_over_ui : GameOverUI

func restart() -> void:
	game_over_ui.visible = false
	get_tree().reload_current_scene()
	score = 0
	Engine.time_scale = 1.0

func quit() -> void:
	get_tree().quit()

func game_over() -> void:
	Engine.time_scale = 0.0
	game_over_ui.visible = true
