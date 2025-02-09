extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const MAX_JUMP = 2

var can_double_jump = false
var jumps = 0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var on_ladder = false

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta): 
	
	use_ladder()
	
	if not is_on_floor():
		velocity.y += gravity * delta 
		if Input.is_action_just_pressed("jump") and jumps > 0 and jumps < MAX_JUMP and can_double_jump:
			jumps+=1	
			velocity.y = JUMP_VELOCITY
			animated_sprite.play("double_jump")
	else:
		jumps = 0
				
	if Input.is_action_just_pressed("jump") and is_on_floor() :
		jump()
			
	var direction = Input.get_axis("left", "right")
	
	# set direction left or right
	if direction<0:
			animated_sprite.flip_h = true
	elif direction>0: 
			animated_sprite.flip_h = false
	
	# Apply animation when player is on floor	run/idle
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor() and !Input.is_action_just_pressed("jump"):
			animated_sprite.play("run")		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor() and !Input.is_action_just_pressed("jump"):
			animated_sprite.play("idle")

	move_and_slide()

#Grouped
func set_player_on_ladder(is_player_on_ladder):
	on_ladder = is_player_on_ladder

func use_ladder():
	if on_ladder:
		gravity =0
		if Input.is_action_pressed("up"):
			velocity.y = -90
		elif Input.is_action_pressed("down"):
			velocity.y = 90
		else:
			velocity.y = 0
	else:
		gravity = 980
		
func jump():
	animated_sprite.play("jump")
	velocity.y = JUMP_VELOCITY		
	jumps+=1

