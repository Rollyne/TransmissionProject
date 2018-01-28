extends Node2D
onready var globals = get_node("/root/globals");

var sceneMechanical = load("res://Levels/LayerScenes/Mechanical.tscn")	
var sceneLight = load("res://Levels/LayerScenes/Light.tscn")
var sceneMorse = load("res://Levels/LayerScenes/Morse.tscn")
var scenePlatformMove = load("res://Levels/LayerScenes/Standart_platform_move.tscn")
var sceneLongWall = load("res://Levels/LayerScenes/Standart_platform_longwall.tscn")

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process_input(true)

func get_layer_node(var layer):
	return get_tree().get_root().get_node("World").get_node("Layers/" + layer);
	

func get_layer_activate_node(var layer):
	return get_tree().get_root().get_node("World").get_node("LayersActivate/" + layer);
	
	
func layerOn(var layer):
	var node;
	if get_layer_node(layer) == null:
			if layer == "Mechanical":
				node = sceneMechanical.instance();
			elif layer == "Morse":
				node = sceneMorse.instance();
			elif layer == "Light":
				node = sceneLight.instance();
			
			add_child(node);
	
	
func layerOff(var layer):
		if get_layer_node(layer) != null:
			get_tree().get_root().get_node("World").get_node("Layers").remove_child(get_layer_node(layer));
			

	
func layerActivate(var layerToShow, var layerOther_1, var layerOther_2, var event, var action):
	if event.is_action_pressed(action):
		if get_layer_node(layerOther_1) == null || get_layer_node(layerOther_2) == null:
			if get_layer_node(layerToShow) == null:
				layerOn(layerToShow);
			elif (get_layer_node(layerOther_2) != null || get_layer_node(layerOther_1) != null):
				
				layerOff(layerToShow);
		
	
	
func _input(event):
	layerActivate("Light", "Mechanical", "Morse", event, "controlLight");
	layerActivate("Mechanical", "Light", "Morse", event, "controlMechanical");
	layerActivate("Morse", "Light", "Mechanical", event, "controlMorse");
	
	if (get_layer_node("Morse") == null):
		globals.setLayerMorseActive(false);
	else:
		globals.setLayerMorseActive(true);
		
	if globals.morseCheck():
		if globals.getCurrCode() == "--.-":
			pass
		elif globals.getCurrCode() == ".-.-":
			var node = scenePlatformMove.instance();
			get_tree().get_root().get_node("World").get_node("Layers").get_node("Standart").add_child(node);
		elif globals.getCurrCde() == "-...":
			pass
		elif globals.getCurrCode() == ".-..":
			var node = sceneLongWall.instance();
			get_tree().get_root().get_node("World").get_node("Layers").get_node("Standart").add_child(node);
		elif globals.getCurrCode() == "-...":
			pass