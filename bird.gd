extends CharacterBody2D


const SPEED = 0
const JUMP_VELOCITY = -500.0
var direction = 0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	#Adds gravity making the bird always fall downwards
	velocity.y += gravity * delta
	
	#adds key actions for bird to flap
	if Input.is_action_just_pressed("jump"):
		direction = 1
		#rotates bird to make it look visually like its flapping its wings
		rotation = -1 * PI / 6
	else:
		#slowly returns back to its original flying position
		if rotation < 0:
			rotation += .01
		direction = 0
	
	#velocity is altered based off flaps
	velocity.y += JUMP_VELOCITY * direction
	
	
	#sets it so bird will collide with objects
	var _collision = move_and_collide(velocity * delta)
