extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	#get_tree().change_scene_to_file("res://scenes/game/levels/test.tscn")
	pass

func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	get_tree().change_scene_to_file("res://scenes/game/levels/test.tscn")
