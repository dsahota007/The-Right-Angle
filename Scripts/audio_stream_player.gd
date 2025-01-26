extends AudioStreamPlayer

@onready var audio_player = $"."

 
var is_muted = false  # Keeps track of whether the audio is muted
var normal_volume = 4.0  # Normal volume level

func _ready():
	# When the singleton first loads, set the volume based on mute state.
	volume_db = db_from_volume(0 if is_muted else normal_volume)
	play()

func toggle_volume():
	is_muted = !is_muted
	volume_db = db_from_volume(0 if is_muted else normal_volume)

func db_from_volume(volume):
	return linear_to_db(volume / 10.0)  # Convert linear volume to dB
