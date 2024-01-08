extends CharacterBody2D

const SPEED = 50.0

func _physics_process(_delta):
	var direction = Vector2()
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("up"):
		direction.y -= 1

	velocity = direction.normalized() * SPEED

	move_and_slide()

	# Handle flipping the sprite.
	if direction.x != 0:
		if direction.x < 0:
			$Sprite2D.scale.x = abs($Sprite2D.scale.x) * -1
		else:
			$Sprite2D.scale.x = abs($Sprite2D.scale.x)

	# Handle animations.
	if direction != Vector2():
		$AnimationPlayer.play("jalan")
	else:
		$AnimationPlayer.play("idle")
