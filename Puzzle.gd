extends Node
var move1=null
var move2=null
var type=0
onready var get1=get_tree().get_root().get_node("World").find_node("Area2D")
onready var get2=get_tree().get_root().get_node("World").find_node("Area2D1")

var current_left=2
var current_right=2
func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("Move_lazers_right"):
		type=1
		move2=2
		move1=-2
		current_left+=1
		if current_left==4:
			current_left=0
		current_right-=1
		if current_right==-1:
			current_right=2
		set_fixed_process(true)
	if event.is_action_pressed("Move_lazers_left"):
		type=2
		move2=-2
		move1=2
		current_left-=2
		if current_left<0:
			current_left+=4
		current_right+=1
		if current_right==3:
			current_right=0
		set_fixed_process(true)
func _fixed_process(delta):
	if type==1:
		get1.set_pos(Vector2(get1.get_pos().x,get1.get_pos().y+move1))
		if get1.get_pos().y<=-350:
			move1=400
		if get1.get_pos().y>=50:
			move1=-2
		if (get1.get_pos().y==-300||get1.get_pos().y==-301)&&current_right==0:
			move1=0
		elif (get1.get_pos().y==-150||get1.get_pos().y==-151)&&current_right==1:
			move1=0
		elif (get1.get_pos().y==0||get1.get_pos().y==-1)&&current_right==2:
			move1=0
		get2.set_pos(Vector2(get2.get_pos().x,get2.get_pos().y+move2))
		if get2.get_pos().y<=-250:
			move2=2
		if get2.get_pos().y>=150:
			move2=-400
		if (get2.get_pos().y==-200||get2.get_pos().y==-201)&&current_left==0:
			move2=0
		elif (get2.get_pos().y==-100||get2.get_pos().y==-101)&&current_left==1:
			move2=0
		elif (get2.get_pos().y==0||get2.get_pos().y==-1)&&current_left==2:
			move2=0
		elif (get2.get_pos().y==100||get2.get_pos().y==99)&&current_left==3:
			move2=0
	elif type==2:
		get1.set_pos(Vector2(get1.get_pos().x,get1.get_pos().y+move1))
		print(get1.get_pos().y)
		if get1.get_pos().y>=50:
			move1=-400
		if get1.get_pos().y<=-350:
			move1=2
		if (get1.get_pos().y==-300||get1.get_pos().y==-301)&&current_right==0:
			move1=0
		elif (get1.get_pos().y==-150||get1.get_pos().y==-151)&&current_right==1:
			move1=0
		elif (get1.get_pos().y==0||get1.get_pos().y==-1)&&current_right==2:
			move1=0
		get2.set_pos(Vector2(get2.get_pos().x,get2.get_pos().y+move2))
		if get2.get_pos().y<=-250:
			move2=400
		if get2.get_pos().y>=150:
			move2=-2
		if (get2.get_pos().y==-200||get2.get_pos().y==-201)&&current_left==0:
			move2=0
		elif (get2.get_pos().y==-100||get2.get_pos().y==-101)&&current_left==1:
			move2=0
		elif (get2.get_pos().y==0||get2.get_pos().y==-1)&&current_left==2:
			move2=0
		elif (get2.get_pos().y==100||get2.get_pos().y==99)&&current_left==3:
			move2=0