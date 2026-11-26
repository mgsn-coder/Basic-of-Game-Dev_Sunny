extends Area2D

const FISH = preload("res://Resources/fish.tres")
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

#ENI Note: dynamic variables
var my_speed_x: float = 0.0;
var my_speed_y: float = 0.0;
var my_direction: float = -1.0;
var my_heal: int = 0;
var my_point: int = 0;
var my_starting_y: float = 0;

var level_manager: Node2D = null

func _init() -> void:
	my_speed_y = randf_range(FISH.speeds[0], FISH.speeds[1])
	my_heal = randi_range(FISH.heal_values[0], FISH.heal_values[1])
	my_point = randi_range(FISH.point_values[0], FISH.point_values[1])
	if my_heal - my_point > 0:
		my_speed_x = my_heal - my_point
	elif my_point - my_heal > 0:
		my_speed_x = my_point - my_heal
	#TODO: make a proper sprite sheet for FISH alone so the width can be used
	global_position.x = randf_range(32, 320-16)
	#TODO: find a proper way to make the fish to understand the water layer
	global_position.y = randf_range(150, 175)
	my_starting_y = global_position.y

func move():
	global_position.x += my_speed_x
	global_position.y += my_speed_y * my_direction

func change_direction():
	if global_position.y < 32:
		global_position.y = 32
		my_direction *= -1
		animated_sprite_2d.flip_v = true
		
func despawn_check():
	if global_position.y == my_starting_y:
		queue_free()

func _process(delta: float) -> void:
	move()
	if my_direction < 0:
			change_direction()
	else:
		despawn_check()

#ENi Note: recycled Sunny's previous code as I forgot how to make signal functions.
#func _on_body_entered(body: CharacterBody2D) -> void:
	#if body.name == "Player1" || body.name == "Player2":
	#print("colision detect")
	#body.increase_hunger(my_heal)
	#level_manager.increase_point(body.name,my_point)
	#queue_free()


func _on_body_entered(body: CharacterBody2D) -> void:
	print("colision detect")
	print(body.name)
	body.increase_hunger(my_heal)
	level_manager.increase_point(body.name,my_point)
	queue_free()
