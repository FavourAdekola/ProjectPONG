extends RigidBody2D

var moving = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if (applied_force.y > 30 and applied_force.y != 0):
		set_applied_force(Vector2(0,applied_force.y - 15))
	elif(applied_force.y < -30 and applied_force.y != 0):
		set_applied_force(Vector2(0,applied_force.y + 15))
	elif (applied_force.y > -30 and applied_force.y < 30):
		set_applied_force(Vector2(0,0))

func reset_pos(player):
	get_tree().change_scene("res://Scenes/World.tscn")
	match player:
		"p1":
			set_applied_force(Vector2(-10,0))
			moving = false
			pass
		"p2":
			global_position = Vector2(512,300)
			set_applied_force(Vector2(10,0))
			moving = false
			pass
