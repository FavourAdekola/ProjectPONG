extends Node2D

onready var anim = $AnimationPlayer

export var canSwing = true


func _process(delta):
	if (Input.is_action_just_pressed("swing") and canSwing):
		anim.play("swing")
