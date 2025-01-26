extends ColorRect

 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$FPS_COUNTER.text = str(Engine.get_frames_per_second())
