extends CharacterBody2D

class_name Enemy

@export var bullet_scene : PackedScene

@onready var bullet_canon : Marker2D = $canon

@export var movement_type: int = 1

@export var direction: Vector2 = Vector2.DOWN
@export var speed: float = 100.0

@export var amplitude: float = 100.0
@export var frequency: float = 2.0
var time_passed: float = 0.0

@export var zigzag_interval: float = 1.0
var zigzag_direction: int = 1

func _ready():
	movement_type = randi_range(1, 3)
	amplitude = randf_range(50.0, 150.0)
	frequency = randf_range(1.0, 3.0)

func _process(delta):
	time_passed += delta
	match movement_type:
		1:
			straight_movement(delta)
		2:
			sine_movement(delta)
		3:
			zigzag_movement(delta)

func straight_movement(delta):
	position += direction * speed * delta

func sine_movement(delta):
	var x_offset = sin(time_passed * frequency) * amplitude
	var movement = Vector2(x_offset, speed * delta)
	position += Vector2(0, speed * delta)
	position.x += sin(time_passed * frequency) * delta * amplitude

func zigzag_movement(delta):
	if int(time_passed / zigzag_interval) % 2 == 0:
		zigzag_direction = 1
	else:
		zigzag_direction = -1
	var move_vec = Vector2(zigzag_direction, 1).normalized()
	position += move_vec * speed * delta

func shoot() -> void:
	var bullet : Bullet = bullet_scene.instantiate()
	bullet.player_bullet = false
	GameManager.origin_node.add_child(bullet)
	bullet.global_position = bullet_canon.global_position
	bullet.rotate(PI)
	bullet.init()

func _on_shoot_timer_timeout() -> void:
	shoot()
