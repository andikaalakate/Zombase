extends Button

@export var stats : Item = null:
	set(value):
		stats = value
		
		if value != null:
			icon = value.icon
		else:
			icon = null
			
func _ready():
	set_process_input(false)

#func _input(event):
	#if stats.name == "pistol":
		#if event.is_action_pressed("use"):
			#var player = preload("res://scenes/game/characters/player/player.tscn")
			#player.shoot()

func use_item():
	if stats == null:
		return

func _on_pressed():
	use_item()
	get_parent().current_index = get_index()
	#player.find_child("Weapons")._on_index(get_index())
