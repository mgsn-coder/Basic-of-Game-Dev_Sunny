extends CharacterBody2D

#ENI Note: testing if a resource file can store the const matters.
@onready var SEAGULL = preload("res://Resources/seagull.tres").instantiate()
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

#ENI Note: dynamic variables
var current_speed: float = 0; 
var current_hunger: int = 0;
var direction: float = 1;
var points: int = 0;
var altitude_penalty: int = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_speed = (SEAGULL.speeds[0] + SEAGULL.speeds[1]) / 2;
	current_hunger = (SEAGULL.hungers[0] + SEAGULL.hungers[1]) / 2;

func get_input():
	if direction == 1:
		if Input.is_action_pressed("move_right") && current_speed < SEAGULL.speeds[1]:
			var temp_speed = current_speed + SEAGULL.speed_interval
			if temp_speed > SEAGULL.speeds[1]:
				temp_speed = SEAGULL.speeds[1] - current_speed
			current_speed = temp_speed
		elif Input.is_action_pressed("move_left") && current_speed > SEAGULL.speeds[0]:
			var temp_speed = current_speed - SEAGULL.speed_interval
			if temp_speed < SEAGULL.speeds[0]:
				temp_speed = SEAGULL.speed_interval - current_speed
			current_speed = temp_speed
		else:
			current_speed = (SEAGULL.speeds[0] + SEAGULL.speeds[1]) / 2 # ENi Note: start with average speed
	elif direction == -1: #ENi Note: to assure that accidental direction 0 does not mess up my brain
		if Input.is_action_pressed("move_left") && current_speed < SEAGULL.speeds[1]:
			var temp_speed = current_speed + SEAGULL.speed_interval
			if temp_speed > SEAGULL.speeds[1]:
				temp_speed = SEAGULL.speeds[1] - current_speed
			current_speed = temp_speed
		elif Input.is_action_pressed("move_right") && current_speed > SEAGULL.speeds[0]:
			var temp_speed = current_speed - SEAGULL.speed_interval
			if temp_speed < SEAGULL.speeds[0]:
				temp_speed = SEAGULL.speed_interval - current_speed
			current_speed = temp_speed
		else:
			current_speed = (SEAGULL.speeds[0] + SEAGULL.speeds[1]) / 2 # ENi Note: start with average speed
	#TODO: map a proper Dive button
	var altitude_fix: float = 0
	if Input.is_action_pressed("move_back"):
		altitude_fix = current_speed
	elif position.y > get_viewport().get_visible_rect().size.y: #ENI Note: hopefully this checks the bottom of the screen.
		var temp_altitude_fix = current_speed * -1
		var low_height: = get_viewport().get_visible_rect().size.y;
		if position.y + temp_altitude_fix < low_height:
			temp_altitude_fix = low_height - position.y
		altitude_fix = temp_altitude_fix
		#too_low_penaly() TODO: fix a proper hunger penalty according to the zones
		altitude_penalty += 1
	else:
		altitude_penalty = 0
	position.x += current_speed * direction
	position.y += altitude_fix

func change_direction():
	if position.x >= 240: #TODO: fix this to be connected to the viewport size
		animated_sprite_2d.flip_h = false
		direction *= -1
		current_hunger -= 1
		position.x = 239 #TODO: fix this to actually have a size based bouncing
	if position.x <= 0: #TODO: fix this to be connected to the viewport size
		animated_sprite_2d.flip_h = true
		direction *= -1
		current_hunger -= 1
		position.x = 1 #TODO: fix this to actually have a size based bouncing

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_input()
	change_direction()
	#check_hunger() TODO: make a proper death scene
