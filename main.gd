extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.end:
		
		$EndScreen.visible = true
		
		await get_tree().create_timer(2).timeout
		get_tree().quit()
	elif Global.win:
		
		$WinScreen.visible = true
		
		await get_tree().create_timer(2).timeout
		get_tree().quit()
