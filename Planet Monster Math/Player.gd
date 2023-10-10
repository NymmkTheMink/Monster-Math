extends KinematicBody2D

const SPEED = 2.5
const JUMP_VELOCITY = -400.0

var velocity = Vector2(0,0)

onready var arm_right = $Sprites/ArmR
onready var arm_left = $Sprites/ArmL

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var mouse_position = null


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Makes the character follow the mouse
	mouse_position = get_global_mouse_position()

	var direction = mouse_position.x - position.x
	velocity.x = direction * SPEED
	$PlayerAnimation.play("Move")
	

	move_and_slide(velocity, Vector2.UP)
