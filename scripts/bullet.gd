extends Area2D

class_name Bullet

@export var player_bullet : bool
@export var damage : int
@export var speed : float

var deplacement : Vector2

func init() -> void:
	if player_bullet:
		deplacement = Vector2(0, -1)
		speed = 700
	else:
		deplacement = Vector2(0, 1)
		speed = 400

func _physics_process(delta: float) -> void:
	translate(deplacement * speed * delta)

func _on_body_entered(body: Node2D) -> void:
	if body is Enemy && player_bullet:
		GameManager.score+=10
		GameManager.player_score_ui.update(GameManager.score)
		body.queue_free()
		queue_free()
	if body is Player && !player_bullet:
		if !GameManager.player.is_invincible:
			GameManager.player.take_damage()
		queue_free()
