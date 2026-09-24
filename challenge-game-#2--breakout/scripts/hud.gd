extends TextureRect

@export var score_label : Label
@export var retry_label : Label
@export var start_label : Label
@export var health_label : Label

@export var game_over_score : Label
@export var game_over_screen : Panel

@export var win_screen : Panel
@export var win_label : Label
@export var win_score_label : Label

func _ready() -> void:
	start_label.visible = true
	retry_label.visible = false
	game_over_screen.visible = false
	win_screen.visible = false

func _process(_delta: float) -> void:
	score_label.text = "SCORE: " + str(Global.score)
	game_over_score.text = score_label.text
	win_score_label.text = score_label.text
