extends Control



func _on_start_game_pressed():
	get_tree().change_scene("res://Scenes/gameSelect.tscn")


func _on_Extra_pressed():
	get_tree().change_scene("res://Scenes/extras.tscn")


func _on_quit_game_pressed():
	get_tree().quit()
