extends AnimatedSprite2D



func _on_hit_box_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://Scenes/endgame_screen.tscn")
