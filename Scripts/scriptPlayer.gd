extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process_input(true)

func get_layer_node(var layer):
	return get_tree().get_root().get_node("World").get_node("Layers/" + layer);
	
	
func layerOnOff(var event, var layer):
		if get_layer_node(layer).is_hidden():
			get_layer_node(layer).show();
		else:
			get_layer_node(layer).hide();
			

	
func layerActivate(var layerToShow, var layerOther_1, var layerOther_2, var event, var action):
	if event.is_action_pressed(action):
		if get_layer_node(layerOther_1).is_hidden() || get_layer_node(layerOther_2).is_hidden():
			layerOnOff(event, layerToShow);
		
		
	
	
func _input(event):
	layerActivate("Red", "Green", "Blue", event, "controlRed");
	layerActivate("Green", "Red", "Blue", event, "controlGreen");
	layerActivate("Blue", "Red", "Green", event, "controlBlue");