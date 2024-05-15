extends CharacterBody2D

class_name Player
signal healthChanged

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D

var jump_max = 2
var jump_count = 0

@export var maxHealth = 3
@onready var currentHealth: int = maxHealth

func _physics_process(delta): #physics process always happens at fixed intervals where _process happens at variable intervals based on 'lag' or other things affect FPS
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_floor() and jump_count!=0:
		jump_count = 0

	# Handle jump.
	#if Input.is_action_just_pressed("jump") and is_on_floor():
	if Input.is_action_just_pressed("jump") and jump_count < jump_max:
		velocity.y = JUMP_VELOCITY
		jump_count += 1



	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	#flip the sprite
	if direction < 0:
		animated_sprite.flip_h = true
	elif direction > 0:
		animated_sprite.flip_h = false
	
	#Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	#applies the movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
