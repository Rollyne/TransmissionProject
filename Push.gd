extends Area2D

onready var player=get_tree().get_root().get_node("World").find_node("Player").find_node("Sprite")
onready var box=get_tree().get_root().get_node("World").find_node("Area2D")
func _ready():
	pass


func _on_Area2D_body_enter( body ):
	if body.get_name()=="Player":
		if (player.get_global_pos().y+30)<(box.find_node("Sprite").get_global_pos().y):
			box.queue_free()
