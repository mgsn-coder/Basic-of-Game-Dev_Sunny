extends CharacterBody2D

const FISH = preload("res://Resources/fish.tres")
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

#ENI Note: dynamic variables
var current_speed_x: float = 0.0;
var current_speed_y: float = 0.0;
var direction: float = -1.0;
var current_heal: int = 0;
var current_point: int = 0;
var starting_y: float = 0;

func _init() -> void:
	current_speed_y = randf_range(FISH.speeds[0], FISH.speeds[1])
	current_heal = randi_range(FISH.heal_values[0], FISH.heal_values[1])
	current_point = randi_range(FISH.point_values[0], FISH.point_values[1])
	if current_heal - current_point > 0:
		current_speed_x = current_heal - current_point
	elif current_point - current_heal > 0:
		current_speed_x = current_point - current_heal
	#TODO: make a proper sprite sheet for FISH alone so the width can be used
	global_position.x = randf_range(32, get_viewport().get_visible_rect().size.y - 32)
	#TODO: find a proper way to make the fish to understand the water layer
	global_position.y = randf_range(150, 175)
	starting_y = global_position.y

func move():
	global_position.x += current_speed_x
	global_position.y += current_speed_y * direction

func change_direction():
	if global_position.y < 32:
		global_position.y = 32
		direction *= -1

func _process(delta: float) -> void:
	move()
	change_direction()
