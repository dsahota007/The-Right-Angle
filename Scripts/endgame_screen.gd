extends Control



func _on_backto_main_pressed():
	get_tree().change_scene_to_file("res://Scenes/mainMenu.tscn")



func _on_quitbtn_pressed():
	get_tree().quit()
