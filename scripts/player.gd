extends CharacterBody2D

class_name Player

@export var bullet_scene : PackedScene

@onready var bullet_canon : Marker2D = $canon
@onready var invincibility_timer : Timer = $invincibility_timer
@onready var shield_sprite : Sprite2D = $shield

@export var health : int = 3
@export var is_invincible : bool
@export var target_position : Vector2

func _physics_process(delta: float) -> void:
	player_movement()

func take_damage() -> void:
	health-=1
	GameManager.camera.shake()
	GameManager.player_health_ui.update(health)
	is_invincible = true
	shield_sprite.visible = true
	invincibility_timer.start()
	if health<=0:
		health=0
		GameManager.game_over()

func shoot() -> void:
	var bullet : Bullet = bullet_scene.instantiate()
	bullet.player_bullet = true
	GameManager.origin_node.add_child(bullet)
	bullet.global_position = bullet_canon.global_position
	bullet.init()

func player_movement() -> void:
	var deplacement = move_inputs()
	velocity = deplacement * 300
	move_and_slide()
	
func move_inputs() -> Vector2:
	var move_inputs : Vector2
	move_inputs.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	move_inputs.y = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	if Input.get_action_strength("clic"):
		target_position = get_global_mouse_position()
		move_inputs.x = target_position.x - position.x
		move_inputs.y = target_position.y - position.y
	move_inputs = move_inputs.normalized()
	return move_inputs

func _on_shoot_timer_timeout() -> void:
	shoot()

func _on_invincibility_timer_timeout() -> void:
	is_invincible = false
	shield_sprite.visible = false
