extends HBoxContainer
class_name hotbar

@onready var slots = get_children()
signal index(i : int)

var current_index : int:
	set(value):
		current_index = value
		reset_focus()
		set_focus()
		#index.emit(current_index)
		
func _ready():
	current_index = 0
	
func _process(delta):
	pass

func reset_focus():
	for slot in slots:
		slot.set_process_input(false)	
		
func set_focus():
	get_child(current_index).grab_focus()
	get_child(current_index).set_process_input(true)
	index.emit(current_index)

func _input(event):
	if Input.is_action_just_pressed("scroll_down"):
		if current_index == get_child_count() - 1:
			current_index = 0
		else:
			current_index += 1
			
	if Input.is_action_just_pressed("scroll_up"):
		if current_index == 0:
			current_index = get_child_count() - 1
		else:
			current_index -= 1
		
	#print(current_index)
		
func add_item(stats):
	for slot in slots:
		if slot.stats == null:
			slot.stats = stats
			return
			
func drop_item():
	var slot = get_child(current_index)
	if slot.stats != null:
		slot.stats = null
		move_stats_to_previous_slots(current_index + 1)

func move_stats_to_previous_slots(start_index):
	for i in range(start_index, get_child_count()):
		var current_slot = get_child(i)
		var previous_slot = get_child(i - 1)
		if current_slot.stats != null and previous_slot.stats == null:
			previous_slot.stats = current_slot.stats
			current_slot.stats = null
