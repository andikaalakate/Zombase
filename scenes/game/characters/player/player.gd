extends CharacterBody2D
class_name player

var SPEED = 100.0
@onready var hotbar = $UI/Hotbar
@onready var item = $Weapons
@onready var world = get_parent()
const bulletpath = preload("res://scenes/items/bullet.tscn")

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
	
	if direction.x != 0:
		if direction.x < 0:
			$body.scale.x = abs($body.scale.x) * -1
		else:
			$body.scale.x = abs($body.scale.x)
		
	if direction != Vector2():
		$AnimationPlayer.play("jalan")
	else:
		$AnimationPlayer.play("idle")
		
func _process(delta):
	if Input.is_action_just_pressed("drop"):
		hotbar.drop_item()
		item.drop_item(world)
		#print("item drop")
	if Input.is_action_just_pressed("use"):
		shoot()
	#if Input.is_action_just_pressed("spawn"):
		#var zombie_scene = preload("res://scenes/game/characters/enemy.tscn")
		#zombie_scene.instantiate()
				
		
	$Node2D.look_at(get_global_mouse_position())
		#
func add_item(stats):
	hotbar.add_item(stats)
	
func is_full(stats):
	if item.get_child_count() == 3:
		print("penuh cik")
		return true
	else:
		return false

func shoot():
	var bullet=bulletpath.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $Node2D/Marker2D.global_position
	bullet.kecepatan = get_global_mouse_position() - bullet.position

func _on_area_2d_2_body_entered(body):
	if body.is_in_group("zombie"):
		get_tree().change_scene_to_file("res://scenes/menu/gameover.tscn")
