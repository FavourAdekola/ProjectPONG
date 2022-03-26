extends Node

onready var timer = $Timer

var p1_score = 0
var bestOf = 3
var p2_score = 0
var winner

func _ready():
	$music.play(1.7)

func restart_game():
	p1_score = 0
	p2_score = 0
	


func _physics_process(_delta):
	if bestOf != 9999:
		if p1_score >= bestOf:
			game_won("p1")
			restart_game()
		if p2_score >= bestOf:
			game_won("p2")
			restart_game()

func game_won(player):
	timer.start(0.4)
	winner = player
	


func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/winScreen.tscn")
	timer.stop()


func _on_music_finished():
	$music.play(1.7)
