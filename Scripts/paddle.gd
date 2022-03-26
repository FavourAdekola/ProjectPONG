extends Node2D

onready var anim = $Node2D/AnimationPlayer

var dir

export var canSwing = true

func updateVars(dir):
	self.dir = dir.normalized()
	

func get_input(player):
	match player:
		1:
			if (Input.is_action_just_pressed("swing") and canSwing):
				anim.play("swing")
		2:  
			if (Input.is_action_just_pressed("swing2") and canSwing):
				anim.play("swing")
		


func _on_Area2D_body_entered(body):
	print(body.get_applied_force())
	if body.name == "ball":
		body.add_central_force(dir*50)
