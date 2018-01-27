extends Node

var currCode = "";
func getCurrCode():
	return currCode;
	
func setCurrCode(var symbol):	
	if currCode.length() == 4:
		currCode = "";
	currCode = currCode + symbol;


var codeList = ["....", "..-.", "--.."];

func morseCheck():
	if (currCode in codeList) && currCode.length() == 4:
		print("This exists!");
		
			
func _ready():

	pass
