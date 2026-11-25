extends CharacterBody2D

const DRONE = preload("res://Resources/drone.tres")
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


#ENI Note: dynamic variables
var my_speed: float = 0.0;
var my_direction: float = 1.0;
var my_damage: int = 0;

var damaged: bool = false;
var my_timeout: int = 0; 

var level_manager: Node2D = null

func _init() -> void:
	my_damage = DRONE.damage
	my_timeout = DRONE.time_out
	my_speed = randf_range(DRONE.speeds[0], DRONE.speeds[1])
	#ENI Note: the spawner should check which edge the drone should appear?
	global_position.y = randf_range(32, 150)
	level_manager = $"."

func move():
	global_position.x += my_speed * my_direction

#ENI Note: this is an attempt to make sure player is not damaged multiple times
func temp_out():
	if damaged:
		my_timeout -= 1
		if my_timeout <= 0:
			collision_shape_2d.disabled = false
			damaged = false
			my_timeout = DRONE.time_out

func update():
	move()
	temp_out()

#ENi Note: recycled Sunny's previous code as I forgot how to make signal functions.
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.decrease_hunger(my_damage)
		collision_shape_2d.disabled = true
		damaged = true

#ENI Note: recycled Sunny's enemy script's logic here.
func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	#clean up off-screen objects
	queue_free()
