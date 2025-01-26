extends RigidBody2D

@export var max_sling_distance = 200.0
@export var slingshot_force = 1100.0
@export var velocity_threshold = 1.0  # Velocity below which the slingshot can be used

var is_slinging = false
var slingshot_start_pos = Vector2.ZERO

func _ready():
	# Make sure the RigidBody2D doesn't enter sleep mode automatically.
	sleeping = false

func _input(event):
	if linear_velocity.length() <= velocity_threshold:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_slinging = true
				slingshot_start_pos = get_global_mouse_position()
			elif is_slinging:
				is_slinging = false
				var mouse_position = get_global_mouse_position()
				var drag_vector = slingshot_start_pos - mouse_position
				var drag_length = drag_vector.length()
				# Scale the force based on the drag length and the max slingshot distance
				var force_multiplier = min(drag_length / max_sling_distance, 1.0)
				apply_slingshot_force(drag_vector.normalized() * slingshot_force * force_multiplier)

func apply_slingshot_force(force):
	# Apply the force based on the drag distance
	linear_velocity = force
	
	

