extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var dead2_flag = false
var cust_timer = 1
var thisbomb=[]
var j=0
var timer=[]
onready var bombs = preload("res://bombanim.tscn")
var flagtest=false

func _ready():
	set_process(true)
	
	
	
var ii=1
func _process(delta):
	
	ii+=1
	if(ii%100==0):
		$CanvasLayer/HBoxContainer/Label.text=str(Performance.get_monitor(Performance.TIME_FPS))
		
		
		
	if Input.is_joy_button_pressed(0,JOY_BUTTON_2) and not dead2_flag:  # for me 2-->4
	
		dead2_flag = true

		thisbomb.append(bombs.instance())
		timer.append(Timer.new())
		timer[j].set_one_shot(true)
		timer[j].set_timer_process_mode(1)
		timer[j].set_wait_time(2.1)
		timer[j].connect("timeout", self, "_on_Timer_timeout")
		
		
		flagtest=true
		
		thisbomb[j].set_position(Globals.Player.get_position())
		add_child(thisbomb[j])
		
		timer[j].start()
		add_child(timer[j])
		j=j+1
		#print("waka waka")
		
	if not Input.is_joy_button_pressed(0,JOY_BUTTON_2):
		if flagtest:
			flagtest=false
			print(timer[0].time_left)
			
		cust_timer=cust_timer+1
		if cust_timer%45==0:
			#print(cust_timer)
			dead2_flag = false
		
		
		


func _on_Timer_timeout():
	print("bombi")
	print(thisbomb)
	var bmb = thisbomb.pop_front()
	var tmr = timer.pop_front()
	j-=1
	bmb.queue_free()
	tmr.queue_free()
	
	print(thisbomb)
	
	
