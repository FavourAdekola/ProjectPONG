extends Node

var p1_score = 0
var bestOf = 3
var p2_score = 0

func restart_game():
	p1_score = 0
	p2_score = 0
	


func _physics_process(_delta):
	if p1_score >= bestOf:
		game_won("p1")
		restart_game()
	if p2_score >= bestOf:
		game_won("p2")
		restart_game()

func game_won(player):
	match player:
		"p1":
			pass
		"p2":
			pass
