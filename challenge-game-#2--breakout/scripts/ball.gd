extends CharacterBody2D

signal win

@export var brick_spawner : Node2D

var speed := 1.0
var speed_increment := 0.02
var max_speed := 5.0
@warning_ignore("integer_division")
var start_pos := Vector2(Global.game_length / 2, Global.game_height / 2)

func _ready() -> void:
	#velocity = Vector2.DOWN * speed
	position = start_pos

func _physics_process(delta: float) -> void:
	var collision := move_and_collide(velocity * speed * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		var collider = collision.get_collider()
		if collider is CharacterBody2D:
			velocity = velocity.rotated(randf_range(-0.15, 0.15))
		if collider.is_in_group("bricks"):
			speed = min(speed + speed_increment, max_speed)
			brick_spawner.bricks_amount -= 1

func reset() -> void:
	position = start_pos
	velocity = Vector2.ZERO

func win_condition() -> void:
	if brick_spawner.bricks_amount == 0:
		win.emit()
