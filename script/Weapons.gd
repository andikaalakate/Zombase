extends Node2D

var current_index: int = 0
@onready var hotbar = $"../UI/Hotbar"

func reset():
	var weapons = get_children()
	for weapon in weapons:
		weapon.hide()
 
func show_weapon(index):
	if index < get_child_count():
		get_child(index).show()
		#print(index)
	
func _ready():
	pass
	
func _on_index(i = current_index):
	reset()
	show_weapon(i)
	current_index = i
	#print(i)
	
func _on_child_entered_tree(node):
	_on_index()
	
func _on_hotbar_index(i = current_index):
	reset()
	show_weapon(i)
	current_index = i
	#print("on hotbar index = ", + i)
	
func drop_item(world):
	if get_child_count() > 0:
		var abs_item = get_child(current_index)
		if abs_item != null:
			abs_item.item_drop(world)
			_on_hotbar_index(current_index)
			#print("drop = ", + current_index)
	

