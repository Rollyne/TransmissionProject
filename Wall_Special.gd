extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Area2D1_body_enter( body ):
	if body.get_name()!="Player"&&body.get_name()!="Platform_2"&&body.get_name()!="Platform_1"&&body.get_name()!="Floor":
		body.queue_free()
