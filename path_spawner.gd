extends Node2D

@onready var path = preload("res://stage1.tscn")
var num_spawn = 5

func _on_timer_timeout() -> void:
	if num_spawn > 0:
		var tempPath = path.instantiate()
		add_child(tempPath)
	num_spawn -= 1
	
