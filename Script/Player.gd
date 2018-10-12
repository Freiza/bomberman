extends KinematicBody2D

var motion = Vector2()
const SPEED = 250
var dead_left = -0.01
var dead_right = 0.01
var dead_up = -0.01
var dead_down = 0.01
var dead2_flag = false
var cust_timer = 1
onready var bombs = preload("res://bombanim.tscn")


func _ready():
	Globals.Player = self
	set_process(false)
	
	
func _physics_process(delta):
	gamepad(delta)
	
func _process(delta):
	
	if Input.is_joy_button_pressed(0,JOY_BUTTON_2) and not dead2_flag:  # for me 2-->4
		dead2_flag = true
		var thisbomb = bombs.instance()
		add_child(thisbomb)
		#print("waka waka")
		
	if not Input.is_joy_button_pressed(0,JOY_BUTTON_2):
		cust_timer=cust_timer+1
		if cust_timer%45==0:
			#print(cust_timer)
			dead2_flag = false
		
		
	

	
	
	
func gamepad(delta):
		
	var x_axis = Input.get_joy_axis(0,JOY_AXIS_0)
	var y_axis = Input.get_joy_axis(0,JOY_AXIS_1)
		
	if x_axis>dead_right:
		motion.x = SPEED * abs(x_axis)
	elif x_axis<dead_left:
		motion.x = -SPEED * abs(x_axis)
	elif y_axis<dead_up:
		motion.y = -SPEED * abs(y_axis)
	elif y_axis>dead_down:
		motion.y = SPEED* abs(y_axis)
	else:
		motion.x =0
		motion.y=0
		
		
	if position.x<16:
		position.x=16
		motion.x=0
		
	if position.x>3270:
		position.x=3250
		motion.x=0
		
	if position.y>1631:
		position.y=1611
		motion.y=0
		
	if position.y<20:
		position.y=20
		motion.y=0
		


		
	move_and_slide(motion)

		
		
		

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass



