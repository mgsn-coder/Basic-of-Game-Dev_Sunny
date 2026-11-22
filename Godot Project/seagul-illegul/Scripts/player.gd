class_name Player extends CharacterBody2D

@onready var game_manager: Node = %GameManager

const speeds: Array[float] = [1, 6] #ENi note: min, max
const hungers: Array[int] = [1,10]
const top_height: float =  25
const speed_interval: float = 3
var direction: float = 1

var current_speed: float = 5
var current_hunger: int = 0
var altitude_penalty: int = 0

var flying_speed := 100.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
#@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var respawn_timer: Timer = $Timer
@onready var gos: Control = $"../UILayer/GameOverScene"
@export var ui_timer := 0.5

var dead = false

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
func _ready():
	current_speed = (speeds[0] + speeds[1]) / 2 # ENi Note: start with average speed
	current_hunger = hungers[1]
	game_manager.update_hunger(current_hunger)
	dead = false

func too_low_penaly():
	if altitude_penalty > 24:
		current_hunger -= 1
		altitude_penalty -= 24
		game_manager.update_hunger(current_hunger)
		
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
		too_low_penaly()
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
		game_manager.update_hunger(current_hunger)
		position.x = 239 #TODO: fix this to actually have a size based bouncing
	if position.x <= 0: #TODO: fix this to be connected to the viewport size
		animated_sprite_2d.flip_h = true
		direction *= -1
		current_hunger -= 1
		game_manager.update_hunger(current_hunger)
		position.x = 1 #TODO: fix this to actually have a size based bouncing

func check_hunger():
	if current_hunger < hungers[0]:
		dead = true
		game_manager.player_dead()
		_die()

func _process(_delta):
	get_input()
	#move_and_slide()
	change_direction()
	check_hunger()
	
func _die():
	await get_tree().create_timer(ui_timer).timeout
	#get_tree() = access global game states and perform major actions across project
	gos.visible = true #Ui is visible when player died
	queue_free()
	#respawn_timer.start()
	#set the timer to restart


#func _on_timer_timeout() -> void: #runs when timer ends
	#get_tree().reload_current_scene()
	
