
extends Control

func _ready():
	if not is_hidden():
		hide()
	get_node("btnBack").connect("pressed", self, "_on_btnBack_pressed")

func _on_btnBack_pressed():
	hide()
