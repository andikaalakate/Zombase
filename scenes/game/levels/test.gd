extends Node2D
class_name main

@export var playerpath = NodePath()
@onready var player = get_node(playerpath)

const zombiepath = preload("res://scenes/game/characters/enemy.tscn")

@onready var pathfollow2d = player.get("path_follow_2d")
@onready var spawn_point = player.get("spawn_point")

var enemies_killed = 0

func rand_enemy_spawnpoint(enemy):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	pathfollow2d.unit_offset = rng.randf_range(0,100)
	var enemyinstance = enemy.instantiate()
	enemyinstance.global_position = spawn_point.global_position
	enemyinstance.player = player
	add_child(enemyinstance)

func _input(event):
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene_to_file("res://scenes/menu/main menu.tscn")
		
