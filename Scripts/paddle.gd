extends Node2D

onready var anim = $Node2D/AnimationPlayer

export var canSwing = true


func _process(delta):
	if (Input.is_action_just_pressed("swing") and canSwing):
		anim.play("swing")
