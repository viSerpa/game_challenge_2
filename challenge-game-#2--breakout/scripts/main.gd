extends Node

@export var game_space : StaticBody2D
@export var ball: CharacterBody2D
@export var player_paddle: CharacterBody2D
@export var hud : TextureRect

var ball_speed := 400.0

func _process(_delta: float) -> void:
	hud.health_label.text = "LIVES: " + str(player_paddle.health)
	player_paddle.player_game_over()
	ball.win_condition()

func _on_player_paddle_game_started() -> void:
	ball.velocity = Vector2.DOWN * ball_speed
	hud.start_label.visible = false

#health - 1, reset paddle and ball pos
func _on_game_space_player_lose() -> void:
	player_paddle.lose_life()
	ball.reset()
	hud.start_label.visible = true

func show_game_over() -> void:
	hud.game_over_screen.visible = true
	hud.start_label.visible = false
	hud.retry_label.visible = true

#game over when health = 0
func _on_player_paddle_game_over() -> void:
	show_game_over()
	if Input.is_action_just_pressed("retry"):
		get_tree().reload_current_scene()

#create win condition
func show_win() -> void:
	hud.win_screen.visible = true
	hud.start_label.visible = false
	hud.retry_label.visible = true

func _on_win() -> void:
	ball.reset()
	show_win()
	if Input.is_action_just_pressed("retry"):
		get_tree().reload_current_scene()
