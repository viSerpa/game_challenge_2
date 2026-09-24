extends CharacterBody2D

signal game_started
signal game_over

const SPEED := 800.0
@warning_ignore("integer_division")
var start_pos := Vector2(Global.game_length / 2, 600)
var game_start := false
var is_alive := true
var health := 3

func _ready() -> void:
	position = start_pos

func get_x_direction() -> float:
	return Input.get_action_strength("move_right") - Input.get_action_strength("move_left")

func _physics_process(_delta: float) -> void:
	if !is_alive:
		return
	elif Input.is_action_just_pressed("move_left") || Input.is_action_just_pressed("move_right"):
		start_game()
	
	var dir_x := Vector2(get_x_direction(), 0)
	velocity = dir_x * SPEED
	
	move_and_slide()

func player_game_over() -> void:
	if health == 0:
		is_alive = false
		game_over.emit()

func start_game() -> void:
	if !game_start:
		game_started.emit()
		game_start = true

func lose_life() -> void:
	if is_alive and health > 0:
		health -= 1
		position = start_pos
		game_start = false
