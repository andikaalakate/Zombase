extends CharacterBody2D

var kecepatan = Vector2(1,0)
var speed = 600

func _physics_process(delta):
	var collision_info = move_and_collide(kecepatan.normalized() * delta * speed)
	if collision_info:
		var collided_object = collision_info.get_collider()
		if collided_object.has_method("take_damage"):
			collided_object.take_damage()
			queue_free()
	
func _on_area_2d_area_entered(area):
	queue_free()
