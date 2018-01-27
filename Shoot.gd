extends Node2D
var can_shoot=true
export (PackedScene) var cannon_ball_scene
var new_ball

export (NodePath) var cannon_ball_spawn_path
onready var cannon_ball_spawn = get_node(cannon_ball_spawn_path)

var timer = null
var bullet_delay = 0.01

func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(bullet_delay)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	
	set_process(true)


func on_timeout_complete():
	can_shoot = true

func _process(delta):
	if(can_shoot):
		new_ball = cannon_ball_scene.instance()
		new_ball.set_global_pos(cannon_ball_spawn.get_global_pos())
		get_parent().add_child(new_ball)
		can_shoot = false
		timer.start()
		
