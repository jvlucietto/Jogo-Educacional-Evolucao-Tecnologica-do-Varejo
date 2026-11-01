extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D

var SPEED = 150.0
var last_direction := Vector2.DOWN

func _physics_process(delta: float) -> void:

	var direction := Input.get_vector(
		"go_left",
		"go_right",
		"go_up",
		"go_down"
	)

	# Impede movimento diagonal
	if abs(direction.x) > abs(direction.y):
		direction.y = 0
	else:
		direction.x = 0

	# Movimento
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO

	# Animações
	if direction != Vector2.ZERO:

		if direction.x != 0:
			last_direction = Vector2(sign(direction.x), 0)
		else:
			last_direction = Vector2(0, sign(direction.y))

		if last_direction == Vector2.DOWN:
			animated_sprite_2d.play("walk_down")
		elif last_direction == Vector2.UP:
			animated_sprite_2d.play("walk_up")
		elif last_direction == Vector2.LEFT:
			animated_sprite_2d.play("walk_left")
		elif last_direction == Vector2.RIGHT:
			animated_sprite_2d.play("walk_right")

	else:

		if last_direction == Vector2.DOWN:
			animated_sprite_2d.play("idle_down")
		elif last_direction == Vector2.UP:
			animated_sprite_2d.play("idle_up")
		elif last_direction == Vector2.LEFT:
			animated_sprite_2d.play("idle_left")
		elif last_direction == Vector2.RIGHT:
			animated_sprite_2d.play("idle_right")

	# Flip
	if direction.x > 0:
		animated_sprite_2d.flip_h = false
	elif direction.x < 0:
		animated_sprite_2d.flip_h = true
		

	move_and_slide()
