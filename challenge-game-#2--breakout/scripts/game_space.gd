extends StaticBody2D

signal player_lose

func _on_kill_zone_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_lose.emit()
