extends CharacterBody2D

#ENI Note: testing if a resource file can store the const matters.
const SEAGULL = preload("res://Resources/seagull.tres")
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

#ENI Note: dynamic variables
var current_speed_x: float = 0.0;
var current_hunger: int = 0;
var direction: float = 1.0;
var current_speed_y: float = 0.0;
var altitude_penalty: int = 0;

var level_manager: Node2D = null;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_speed_x = (SEAGULL.speeds[0] + SEAGULL.speeds[1]) / 2;
	#ENI Note: using temp_calc to please Godot's "decimal reduction" warning with floating ints
	var temp_calc = (float(SEAGULL.hungers[0]) + float(SEAGULL.hungers[1])) / 2; # ENi Note: tested if works with randi() % 10 + 1
	current_hunger =  int(temp_calc)
	level_manager = get_parent().get_parent()

func control_speed(input_x: float = 0.0):
	if input_x != 0.0: #Sunny note: != = not equal
		var temp_speed = current_speed_x
		if input_x == direction: #ENI Note: player presses the same direction
			temp_speed += SEAGULL.speed_interval
			if temp_speed > SEAGULL.speeds[1]:
				temp_speed = SEAGULL.speeds[1]
			current_speed_x = temp_speed
		else:  #ENI Note: this should be pressing different direction
			temp_speed -= SEAGULL.speed_interval
			if temp_speed < SEAGULL.speeds[0]:
				temp_speed = SEAGULL.speeds[0]
			current_speed_x = temp_speed
	else: #ENI Note: this should return the speed back to normal
		var start_speed = (SEAGULL.speeds[0] + SEAGULL.speeds[1]) / 2
		var temp_speed = current_speed_x
		if current_speed_x < start_speed:
			temp_speed += SEAGULL.speed_interval
			if temp_speed > start_speed:
				temp_speed = start_speed
			current_speed_x = temp_speed
		if current_speed_x > start_speed:
			temp_speed -= SEAGULL.speed_interval
			if temp_speed < start_speed:
				temp_speed = start_speed
			current_speed_x = temp_speed

func control_altitude(input_y: float = 0.0):
	current_speed_y = 0
	if input_y != 0.0:
		var temp_speed = current_speed_x
		if temp_speed < 0.0:
			temp_speed *= -1
		if global_position.y + temp_speed >= get_viewport().get_visible_rect().size.y:
			temp_speed = get_viewport().get_visible_rect().size.y - global_position.y
		current_speed_y = temp_speed
	elif global_position.y > SEAGULL.height:
		var temp_speed = current_speed_x
		if temp_speed > 0.0:
			temp_speed *= -1
		if global_position.y + temp_speed <= SEAGULL.height:
			temp_speed = (SEAGULL.height) - global_position.y
		current_speed_y = temp_speed

func increase_hunger(heal_value: int = 0):
	var temp_value = heal_value
	if current_hunger + temp_value > SEAGULL.hungers[1]:
		temp_value = SEAGULL.hungers[1] - current_hunger
	current_hunger += temp_value

func decrease_hunger(damage_value: int = 0):
	var temp_value = damage_value
	if current_hunger - temp_value < SEAGULL.hungers[0]:
		temp_value = damage_value - current_hunger
	current_hunger -= temp_value
	
func move_seagull():
	global_position.x += current_speed_x * direction
	global_position.y += current_speed_y

func change_direction():
	if global_position.x >= get_viewport().get_visible_rect().size.x: #TODO: fix this to be connected to the viewport size
		animated_sprite_2d.flip_h = true
		direction *= -1
		current_hunger -= 1
		global_position.x = get_viewport().get_visible_rect().size.x #TODO: fix this to actually have a size based bouncing
	if global_position.x <= 0: #TODO: fix this to be connected to the viewport size
		animated_sprite_2d.flip_h = false
		direction *= -1
		current_hunger -= 1
		global_position.x = 1 #TODO: fix this to actually have a size based bouncing

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_seagull()
	change_direction()
