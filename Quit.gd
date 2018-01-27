extends Node2D

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if get_node("Panel").is_hidden()==true:
			print(get_node("Panel").is_hidden())
			get_node("Panel").show()
		elif get_node("Panel").is_hidden()==false:
			print("Close menu")
			get_node("Panel").hide()

