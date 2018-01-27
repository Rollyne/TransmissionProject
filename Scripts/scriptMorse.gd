extends Node2D


var time = 0.0;
var morseRelease = false;
onready var globals = get_node("/root/globals");

func _ready():
	set_fixed_process(true);
	set_process_input(true);
	

func _input(event):
	if event.is_action_released("morsePress"):
		morseRelease = true;

func _fixed_process(delta):	
	if globals.getLayerMorseActive():
		if Input.is_action_pressed("morsePress"):
			
			#Stopwatch counts
			time = time + delta
			print(time);
			
		elif morseRelease:
			#Check and add morse code
			if time <= 0.4 && time != 0:
				globals.setCurrCode(".");
				print(globals.getCurrCode());
			elif time > 0.4 && time < 1.5:
				globals.setCurrCode("-");
				print(globals.getCurrCode());
			
			
			globals.morseCheck();
			time = 0;
			morseRelease = false;	
		
		
		
	
	
		

