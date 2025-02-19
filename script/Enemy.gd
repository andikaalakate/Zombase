extends CharacterBody2D
class_name zombie

var health = 100

func _physics_process(delta):
	move_and_slide()
	
	if velocity.length() > 0:
		$AnimationPlayer.play("jalan")
		
	if velocity.x > 0:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true

func take_damage():
	health -= 50
	if health <= 0:
		queue_free()
