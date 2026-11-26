extends Node2D

@export var burger_template: PackedScene


var tick: int = 6 #Sunny note; when tick hits 0, fish is spawned
const default_tick: int = 60 #Sunny note; 60 is ever frames
#const is not able to change


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: 
	tick -= 1 #Sunny note: Every frame, tick is reduced by 1
	if tick <= 0:
		spawn_burger()
		tick = default_tick

func spawn_burger():
	var b = burger_template.instantiate() #create new fish
	add_child(b)
	#Sunny note: add child to itself (FishManager)
