extends Panel


@onready var tower = preload("res://red_bullet_tower.tscn")
var currTile

func _on_gui_input(event):
	var tempTower = tower.instantiate()
	# Left Click Down
	if event is InputEventMouseButton and event.button_mask == 1:
		add_child(tempTower)

		tempTower.process_mode = Node.PROCESS_MODE_DISABLED

		tempTower.scale = Vector2(0.32,0.32)
		$TowerDefenseTile250.visible = false

	elif event is InputEventMouseMotion and event.button_mask == 1: # Left Click Drag
		if get_child_count() > 1:
			get_child(1).global_position = event.global_position
			
			var mapPath = get_tree().get_root().get_node("Main/TileMapLayer")
			var tile = mapPath.local_to_map(get_global_mouse_position())
			currTile = mapPath.get_cell_atlas_coords(tile)
			print(currTile)
			if (currTile == Vector2i(1,1) or currTile == Vector2i(6,1) or currTile == Vector2i(1,3) or currTile == Vector2i(1,2)):
				get_child(1).get_node("Panel").modulate = Color(255,0,0)
			else:	
				get_child(1).get_node("Panel").modulate = Color(255,255,255)
	elif event is InputEventMouseButton and event.button_mask == 0: # Left Click Up
		if get_child_count() > 1:
			get_child(1).queue_free()

		var path = get_tree().get_root().get_node("Main/towers")

		path.add_child(tempTower)
		#print(event.global_position)
		print(tempTower.global_position)
		event.global_position[0] -= 620
		event.global_position[1] -= 330
		tempTower.global_position = event.global_position
		print(event.global_position)
		tempTower.get_node("Panel").hide()
	else:
		if get_child_count() > 1:
			get_child(1).queue_free()
