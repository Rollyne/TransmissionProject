
extends Control



onready var tree = get_tree()
onready var _option = get_parent().get_node("option")

func _ready():
	get_node("buttons/btnStart").connect("pressed", self, "_on_btnStart_pressed")
	get_node("buttons/btnOption").connect("pressed", self, "_on_btnOption_pressed")
	get_node("buttons/btnQuit").connect("pressed", self, "_on_btnQuit_pressed")

func _on_btnStart_pressed():
	get_node("/root/Change").goto_scene("res://Levels/Level_Select.tscn")

func _on_btnOption_pressed():
	_option.show()

func _on_btnQuit_pressed():
	tree.quit()
