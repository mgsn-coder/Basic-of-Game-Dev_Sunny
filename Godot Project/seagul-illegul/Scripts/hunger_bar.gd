'''
ENI Note: 
For hunger bar, recheck this
https://gamedevacademy.org/progressbar-in-godot-complete-guide/

Current hunger value is kept in the seagull because
I will try to use seagull to call the death of the seagull.
'''
extends ProgressBar

var player: CharacterBody2D = null

func _ready() -> void:
	player = get_parent()

func update_hungerbar():
	value = player.current_hunger

func _process(delta: float) -> void:
	update_hungerbar()
