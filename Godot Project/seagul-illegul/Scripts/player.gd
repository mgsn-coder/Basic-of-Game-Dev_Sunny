class_name Player extends CharacterBody2D

const speeds: Array[float] = [1, 6] #ENi note: min, max
const top_height: float =  25
const speed_interval: float = 3
var direction: float = 1

var current_speed: float = 5

var flying_speed := 100.0
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var respawn_timer: Timer = $Timer
@onready var gos: Control = $"../UILayer/GameOverScene"
@export var ui_timer := 0.5


	#Input buttons
'''
	ENi Note: old code
	func get_input():
		var input_direction = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
		velocity = input_direction * flying_speed
		#FLip player
		if Input.is_action_pressed("move_right"):
			sprite_2d.flip_h = true
			elif Input.is_action_pressed("move_left"):
				sprite_2d.flip_h = false
'''	
func ready():
	current_speed = (speeds[0] + speeds[1]) / 2 # ENi Note: start with average speed
	position.x = 240 / 2 #TODO fix this to be connected directly to the viewport size

func get_input():
	if direction == 1:
		if Input.is_action_pressed("move_right") && current_speed < speeds[1]:
			var temp_speed = current_speed + speed_interval
			if temp_speed > speeds[1]:
				temp_speed = speeds[1] - current_speed
			current_speed = temp_speed
		elif Input.is_action_pressed("move_left") && current_speed > speeds[0]:
			var temp_speed = current_speed - speed_interval
			if temp_speed < speeds[0]:
				temp_speed = speed_interval - current_speed
			current_speed = temp_speed
		else:
			current_speed = (speeds[0] + speeds[1]) / 2 # ENi Note: start with average speed
	elif direction == -1: #ENi Note: to assure that accidental direction 0 does not mess up my brain
		if Input.is_action_pressed("move_left") && current_speed < speeds[1]:
			var temp_speed = current_speed + speed_interval
			if temp_speed > speeds[1]:
				temp_speed = speeds[1] - current_speed
			current_speed = temp_speed
		elif Input.is_action_pressed("move_right") && current_speed > speeds[0]:
			var temp_speed = current_speed - speed_interval
			if temp_speed < speeds[0]:
				temp_speed = speed_interval - current_speed
			current_speed = temp_speed
		else:
			current_speed = (speeds[0] + speeds[1]) / 2 # ENi Note: start with average speed
	#TODO: map a proper Dive button
	var altitude_fix: float = 0
	if Input.is_action_pressed("move_back"):
		altitude_fix = current_speed
	elif position.y > top_height:
		var temp_altitude_fix = current_speed * -1
		if position.y + temp_altitude_fix < top_height:
			temp_altitude_fix = top_height - position.y
		altitude_fix = temp_altitude_fix
	position.x += current_speed * direction
	position.y += altitude_fix

func change_direction():
	if position.x >= 240: #TODO: fix this to be connected to the viewport size
		sprite_2d.flip_h = false
		direction *= -1
	if position.x <= 0: #TODO: fix this to be connected to the viewport size
		sprite_2d.flip_h = true
		direction *= -1

func _process(_delta):
	get_input()
	#move_and_slide()
	change_direction()
	
func _die():
	await get_tree().create_timer(ui_timer).timeout
	#get_tree() = access global game states and perform major actions across project
	gos.visible = true #Ui is visible when player died
	queue_free()
	#respawn_timer.start()
	#set the timer to restart


#func _on_timer_timeout() -> void: #runs when timer ends
	#get_tree().reload_current_scene()
	
