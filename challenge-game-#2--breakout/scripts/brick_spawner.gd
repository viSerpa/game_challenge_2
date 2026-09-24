extends Node2D

@export var brick : PackedScene

var brick_width := 128.0
var brick_height := 32.0
var bricks_amount := 0
var start_pos := Vector2(0, brick_height)
var spawn_amount := 9

func _ready() -> void:
	position = start_pos
	spawn_multiple_bricks(spawn_amount)

func spawn_multiple_bricks(amount: int) -> void:
	var brick_rows := 5
	for row in range(brick_rows):
		for col in range(amount):
			var new_brick = brick.instantiate()
			
			new_brick.position = Vector2((brick_width) * col, (brick_height) * row)
			bricks_amount += 1
			add_child(new_brick)
