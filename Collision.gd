extends KinematicBody2D

const MOVEMENT_SPEED = 10
# Start
func _ready():
	set_process(true)


func _process(delta):
	# Move
	set_pos(Vector2(get_pos().x + MOVEMENT_SPEED, get_pos().y))
	# If the cannon_ball have left the screen on the right side, remove it!
	if(get_pos().x > OS.get_window_size().x):
		queue_free()
