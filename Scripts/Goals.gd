extends Node

onready var p1Goal = $LWall/P1Score
onready var p2Goal = $RWall/P2Score

func _on_P1Score_body_entered(body):
	if body.name == "ball":
		print("ballin")
		GameControl.p2_score += 1
		body.reset_pos("p2")
		body.global_position = Vector2(512,300)


func _on_P2Score_body_entered(body):
	if body.name == "ball":
		print("ballin")
		GameControl.p1_score += 1
		body.reset_pos("p1")
		body.global_position = Vector2(512,300)
		
