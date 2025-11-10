extends Node2D

class_name Spawner

@export var enemy_scene : PackedScene

func _on_timer_timeout() -> void:
	var enemy : Enemy = enemy_scene.instantiate()
	GameManager.origin_node.add_child(enemy)
	var pos_x = randf_range(100, 601)
	enemy.global_position = Vector2(pos_x, -100)
