extends Node2D

var zombie_scene = preload("res://scenes/game/characters/enemy.tscn")
var max_zombies = 2
var current_zombies = 0

func _ready():
	$Timer.start()

func _on_Timer_timeout():
	if current_zombies < max_zombies:
		spawn_zombie()
		current_zombies += 1

func spawn_zombie():
	var zombie = zombie_scene.instantiate()
	var random_position = $Area2D.global_position + Vector2(randf_range(-100, 100), randf_range(-100, 100))
	zombie.global_position = random_position
	get_tree().root.add_child(zombie)

func zombie_died():
	current_zombies -= 1
