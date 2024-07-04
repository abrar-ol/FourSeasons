extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D


func _physics_process(delta): 
	
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * SPEED
		if direction<0:
			animated_sprite.flip_h = true
		else: 
			animated_sprite.flip_h = false
		animated_sprite.play("run")		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.x == 0 :
			animated_sprite.play("idle")

	move_and_slide()
			
			
