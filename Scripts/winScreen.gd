extends Control

onready var label = $ColorRect/Label

func _ready():
	match GameControl.winner:
		"p1":
			label.text = "Player 1 Won"
			pass
		"p2":
			label.text = "Player 2 Won"
			pass

func _on_restart_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")


func _on_quit_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
