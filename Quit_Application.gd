extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	pass


func _on_Button_pressed():
	get_node("/root/Change").goto_scene("res://Levels/Level_Select.tscn")
