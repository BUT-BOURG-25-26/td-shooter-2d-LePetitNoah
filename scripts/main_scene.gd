extends Node2D

func _ready() -> void:
	GameManager.origin_node = self
	GameManager.player = $Player
	GameManager.player_health_ui = $PlayerHealth
	GameManager.player_health_ui.update(GameManager.player.health)
	GameManager.player_score_ui = $PlayerScoreUi
	GameManager.player_score_ui.update(0)
	GameManager.game_over_ui = $GameOver
	GameManager.camera = $Camera2D
