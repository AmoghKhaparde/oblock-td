extends CharacterBody2D


@export var speed = 1000
var Health = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	
	if get_parent().get_progress_ratio() >= 0.99: # this count the percent of the path it has completed=, if it has reached the 99% mark, then make the enemy disappear
		print("progress ratio is 1")
		queue_free()
	if Health <= 0:
		get_parent().get_parent().queue_free()
