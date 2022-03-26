extends Control


func _on_five_pressed():
	GameControl.bestOf = 5
	get_tree().change_scene("res://Scenes/World.tscn")


func _on_seven_pressed():
	GameControl.bestOf = 7
	get_tree().change_scene("res://Scenes/World.tscn")


func _on_Quit_pressed():
	GameControl.bestOf = 9999
	get_tree().change_scene("res://Scenes/World.tscn")
	
