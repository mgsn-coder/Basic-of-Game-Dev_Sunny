extends CharacterBody2D

const SPEED := 15.0

func _ready() -> void:
	velocity = Vector2(-SPEED,0)
	#move left with SPEED (-400,0)

func _physics_process(_delta: float) -> void:
	var collision := move_and_collide(velocity)
	#move and collide when collision occurs 
	#= bounce back when crash with collision
	if collision:
		var normal := collision.get_normal()
		velocity = velocity.bounce(normal)
		#bounce back with the same velocity
		#Godot will calculate the normal angle (90 degree -> the angle it hit)
		#Then return in the mirror direction with the same angle it hit
