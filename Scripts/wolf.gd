extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const WALK_SPEED = 100.0
const RUN_SPEED = 200.0
const DASH_SPEED = 400.0
const JUMP_VELOCITY = -300.0
const DASH_DURATION = 0.2

var current_speed = WALK_SPEED
var is_dashing = false
var dash_direction = Vector2.ZERO
var dash_timer = 0.0

func _physics_process(delta: float) -> void:
	if is_dashing:
		velocity = dash_direction * DASH_SPEED
		dash_timer += delta
		if dash_timer >= DASH_DURATION:
			is_dashing = false
	else:
		if Input.is_action_pressed("Shift"):
			current_speed = RUN_SPEED
			if is_on_floor() and velocity.x != 0:
				animated_sprite_2d.play("run")
			elif is_on_floor():
				animated_sprite_2d.play("idle")
		else:
			current_speed = WALK_SPEED
			if is_on_floor() and velocity.x != 0:
				animated_sprite_2d.play("walk")
			elif is_on_floor():
				animated_sprite_2d.play("idle")

		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta
			if velocity.y < 0: # Going up
				if not animated_sprite_2d.is_playing() or animated_sprite_2d.animation != "jump":
					animated_sprite_2d.play("jump")
			elif velocity.y > 0: # Falling
				if not animated_sprite_2d.is_playing() or animated_sprite_2d.animation != "fall":
					animated_sprite_2d.play("fall")

		# Handle jump.
		if Input.is_action_just_pressed("W") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			animated_sprite_2d.play("jump")

		# Get the input direction and handle the movement/deceleration.
		var direction := Input.get_axis("A", "D")
		if direction:
			velocity.x = direction * current_speed
			if is_on_floor() and not Input.is_action_pressed("Shift"):
				animated_sprite_2d.play("walk")
			if direction < 0 :
				animated_sprite_2d.flip_h = true
			else:
				animated_sprite_2d.flip_h = false
		else:
			velocity.x = move_toward(velocity.x, 0, current_speed)
			if is_on_floor() and not Input.is_action_pressed("Shift"):
				animated_sprite_2d.play("idle")

		# Handle dash
		if Input.is_action_just_pressed("Space"):
			var dash_input := Input.get_axis("A", "D")
			if dash_input != 0:
				is_dashing = true
				dash_direction = Vector2(dash_input, 0).normalized()
				animated_sprite_2d.play("dash")
				dash_timer = 0.0
			else:
				animated_sprite_2d.play("idle")

	move_and_slide()
