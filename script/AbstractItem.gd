extends Sprite2D
class_name abs_item

@onready var collision = $Area2D/CollisionShape2D
@onready var player = $"../Player"

@export var stats : Item
#var timer = Timer.new()
@export var index : int

func _ready():
	if stats != null:
		texture = stats.icon
	set_process_input(false)
	
func _on_player_entered(player):
	set_process_input(true)
	
func _input(event):
	if Input.is_action_just_pressed("interact"):
		if player.is_full(stats):
			null
		else:
			pick_up(player)
			
func pick_up(player):
	call_deferred("reparent",player.find_child("Weapons"))
	position = player.position
	player.add_item(stats)
	collision.call_deferred("set_disabled",true)
	
func item_drop(world):
	reparent(world)
	collision.call_deferred("set_disabled",false)
	
func _on_area_2d_body_exited(body):
	set_process_input(false)
	
