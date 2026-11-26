extends Node2D

@export var fish_template: PackedScene


var tick: int = 6 #Sunny note; when tick hits 0, fish is spawned
const default_tick: int = 60 #Sunny note; 60 is ever frames
#const is not able to change


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: 
	tick -= 1 #Sunny note: Every frame, tick is reduced by 1
	if tick <= 0:
		spawn_fish()
		tick = default_tick

func spawn_fish():
	var f = fish_template.instantiate() #create new fish
	#Sunny note: Connecting fish with Level manager after the fish is created
	#Level manager is the parent of fish manager
	f.level_manager = get_parent() 
	#Sunny note: fish manager adds the new fish under itself as a child
	add_child(f)
