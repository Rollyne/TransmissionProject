extends Node

var layerMorseActive = false;
var laserIsSolved = false;

func setLayerMorseActive(mode):
	layerMorseActive = mode;

func getLayerMorseActive():
	return layerMorseActive;

var currCode = "";
func getCurrCode():
	return currCode;
	
func setCurrCode(var symbol):	
	if currCode.length() == 4:
		currCode = "";
	currCode = currCode + symbol;
	

var codeList = ["-...", ".-..", "--..", "-...", ".-.-", "--.-"];

func morseCheck():
	if (currCode == codeList.back()) && currCode.length() == 4:
		if (currCode == "-..." && laserIsSolved == false):
			return false;
			
		codeList.pop_back();
		return true;
		
			
func _ready():

	pass
