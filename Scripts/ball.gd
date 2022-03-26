extends RigidBody2D


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

