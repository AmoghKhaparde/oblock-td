extends CharacterBody2D


var speed = 1000
var Health = 10
var end = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	
	if get_parent().get_progress_ratio() >= 0.99: # this count the percent of the path it has completed=, if it has reached the 99% mark, then make the enemy disappear
		print("progress ratio is 1")
		speed = 0
		Global.end = true
		
		queue_free()
	if Health <= 0:
		get_parent().get_parent().queue_free()
		Global.killed += 1
		print(Global.killed)
		
	if Global.killed == 100:
		Global.win = true
